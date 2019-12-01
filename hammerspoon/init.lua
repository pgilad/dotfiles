local hyper = {"cmd", "alt", "ctrl", "shift"}
local log = hs.logger.new('hammerspoon','debug')

function openApp(name)
    app = hs.application.find(name)

    if app and app:isFrontmost() then
        app:hide()
        return
    end

    hs.application.launchOrFocus(name)
end

function mountApp(appName)
    return function()
        openApp(appName)
    end
end

hs.hotkey.bind(hyper, 'c', mountApp("Google Chrome"))
hs.hotkey.bind(hyper, 'i', mountApp("iTerm"))
hs.hotkey.bind(hyper, 'j', mountApp("IntelliJ IDEA"))
hs.hotkey.bind(hyper, 's', mountApp("Slack"))
hs.hotkey.bind(hyper, 't', mountApp("Alacritty"))

hs.hotkey.bind(hyper, "r", function() hs.reload() end)

-- local wifiMenu = hs.menubar.newWithPriority(2147483645)

-- function ssidChanged()
-- wifiMenu:setTitle(hs.wifi.currentNetwork() or "Offline")
-- end

-- wifiWatcher = hs.wifi.watcher.new(ssidChanged):start()
-- ssidChanged()
