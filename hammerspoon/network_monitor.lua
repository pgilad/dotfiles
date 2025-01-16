local M = {}

function M.setup()
    local logger = hs.logger.new("NetMonitor", "info")
    logger:i("Setting up network monitor")

    -- Add debounce timer variable
    local debounceTimer = nil
    local lastWifiState = nil
    local NETWORK_DEBOUNCE_DELAY = 2 -- seconds

    -- Function to check LAN connection state
    local function isLanConnected()
        logger:i("Checking LAN connection status")

        -- Get list of network interfaces
        local interfaces = hs.network.interfaces()

        -- Iterate through interfaces that start with "en"
        for _, interface in ipairs(interfaces) do
            if interface:match("^en") then
                local details = hs.network.interfaceDetails(interface)

                -- Check if interface is active, has IPv4, and is not WiFi
                if details and details.Link.Active and details.IPv4 and not details.AirPort then
                    logger:i("Found active ethernet connection on: " .. interface)
                    return true
                end
            end
        end

        logger:i("No active LAN connection found")
        return false
    end

    local function toggleWifi(enable)
        -- Don't toggle if state hasn't changed
        if lastWifiState == enable then
            logger:i("Wifi already in desired state: " .. tostring(enable))
            return
        end

        local wifiInterface = hs.wifi.interfaceDetails()

        if not wifiInterface then
            logger:w("Cannot access WiFi interface")
            return
        end

        local wifiPower = wifiInterface.power
        lastWifiState = enable

        if enable and not wifiPower then
            logger:i("Enabling Wi-Fi")
            hs.wifi.setPower(true)
            hs.notify.new({
                title = "Hammerspoon",
                informativeText = "LAN connection detected, Wi-Fi enabled."
            }):send()
        elseif not enable and wifiPower then
            logger:i("Disabling Wi-Fi")
            hs.wifi.setPower(false)
            hs.notify.new({
                title = "Hammerspoon",
                informativeText = "LAN connection detected, Wi-Fi disabled."
            }):send()
        else
            logger:i("Wifi state unchanged")
        end
    end

    local function setupNetworkWatcher()
        -- Cancel any pending timer
        if debounceTimer then
            debounceTimer:stop()
        end

        -- Set new timer with 1 second delay
        debounceTimer = hs.timer.doAfter(NETWORK_DEBOUNCE_DELAY, function()
            if isLanConnected() then
                logger:i("LAN connected, ensuring that Wi-Fi is disabled")
                toggleWifi(false)
            else
                logger:i("LAN disconnected, ensuring that Wi-Fi is enabled")
                toggleWifi(true)
            end
        end)
    end

    local networkWatcher = hs.network.reachability.internet():setCallback(function()
        setupNetworkWatcher()
    end)

    networkWatcher:start()
    setupNetworkWatcher()
end

return M
