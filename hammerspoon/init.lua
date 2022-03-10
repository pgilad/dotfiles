hs.loadSpoon("SpoonInstall")

spoon.SpoonInstall.use_syncinstall = true
-- Make the alerts look nicer.
hs.alert.defaultStyle.strokeColor =  {white = 1, alpha = 0}
hs.alert.defaultStyle.fillColor =  {white = 0.05, alpha = 0.75}
hs.alert.defaultStyle.radius =  10

-- Disable the slow default window animations.
hs.window.animationDuration = 0

local logger = hs.logger.new("hammerspoon", "info")
local hyper = {"cmd", "alt", "ctrl", "shift"}
local pocket = require("pocket")
local airPods = require("airPods")

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

hs.hotkey.bind(
    hyper,
    "n",
    function()
        -- get the focused window
        local win = hs.window.focusedWindow()
        -- get the screen where the focused window is displayed, a.k.a. current screen
        local screen = win:screen()
        -- compute the unitRect of the focused window relative to the current screen
        -- and move the window to the next screen setting the same unitRect
        win:move(win:frame():toUnitRect(screen:frame()), screen:next(), true, 0)
    end
)

-- Disable animations
hs.window.animationDuration = 0

hs.hotkey.bind(
    hyper,
    "f",
    function()
        local win = hs.window.focusedWindow()
        if not win then
            return
        end
        win:moveToUnit(hs.layout.maximized)
    end
)

hs.hotkey.bind(hyper, "c", mountApp("Google Chrome"))
hs.hotkey.bind(hyper, "j", mountApp("IntelliJ IDEA"))
hs.hotkey.bind(hyper, "s", mountApp("Slack"))
hs.hotkey.bind(hyper, "g", mountApp("Craft"))
hs.hotkey.bind(hyper, "t", mountApp("Alacritty"))
-- hs.hotkey.bind(hyper, "o", mountApp("Obsidian"))

hs.hotkey.bind(
    hyper,
    "r",
    function()
        hs.reload()
    end
)

hs.hotkey.bind(
    hyper,
    "p",
    function()
        local url = hs.pasteboard.getContents()
        pocket.addToPocket(url)
    end
)

-- hs.hRotkey.bind(hyper, "i", function()
--   airPods.toggle("Gilad-AirPods-Pro")
-- end)

-- re-sizing window
hs.hotkey.bind(
    hyper,
    "Left",
    function()
        local win = hs.window.focusedWindow()
        if not win then
            return
        end
        win:moveToUnit(hs.layout.left50)
    end
)

hs.hotkey.bind(
    hyper,
    "Right",
    function()
        local win = hs.window.focusedWindow()
        if not win then
            return
        end
        win:moveToUnit(hs.layout.right50)
    end
)

--hs.hotkey.bind(hyper, '6', function()
--   hs.console.hswindow():focus()
-- end)

-- local wifiMenu = hs.menubar.newWithPriority(2147483645)

-- function ssidChanged()
-- wifiMenu:setTitle(hs.wifi.currentNetwork() or "Offline")
-- end

-- wifiWatcher = hs.wifi.watcher.new(ssidChanged):start()
-- ssidChanged()
--
wifiMenu = hs.menubar.newWithPriority(2147483645)
-- wifiMenu:setTitle(hs.wifi.currentNetwork())

wifiWatcher = nil

function ssidChanged()
    local wifiName = hs.wifi.currentNetwork()
    if wifiName then
        wifiMenu:setTitle(wifiName)
    else
        wifiMenu:setTitle("Wifi OFF")
    end
end

wifiWatcher = hs.wifi.watcher.new(ssidChanged):start()

hs.notify.new(
    {
        title = "Hammerspoon",
        informativeText = "Hammerspoon is ready",
        autoWithdraw = true,
        hasActionButton = false
    }
):send()
