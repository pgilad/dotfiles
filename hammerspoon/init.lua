-- Basic Configuration
hs.loadSpoon("SpoonInstall")
spoon.SpoonInstall.use_syncinstall = true

-- Logger Setup
local logger = hs.logger.new("Main", "info")

-- Constants
local hyper = {"cmd", "alt", "ctrl", "shift"}

-- UI Settings
local function setupUIStyle()
    -- Alert styling
    hs.alert.defaultStyle.strokeColor = {
        white = 1,
        alpha = 0
    }
    hs.alert.defaultStyle.fillColor = {
        white = 0.05,
        alpha = 0.75
    }
    hs.alert.defaultStyle.radius = 10

    -- Disable animations
    hs.window.animationDuration = 0
end

-- Window Management Functions
local function setupWindowManager()
    -- Move window to next screen
    hs.hotkey.bind(hyper, "n", function()
        local win = hs.window.focusedWindow()
        if win then
            local screen = win:screen()
            win:move(win:frame():toUnitRect(screen:frame()), screen:next(), true, 0)
        end
    end)

    -- Maximize window
    hs.hotkey.bind(hyper, "f", function()
        local win = hs.window.focusedWindow()
        if win then
            win:moveToUnit(hs.layout.maximized)
        end
    end)

    -- Left half
    hs.hotkey.bind(hyper, "Left", function()
        local win = hs.window.focusedWindow()
        if win then
            win:moveToUnit(hs.layout.left50)
        end
    end)

    -- Right half
    hs.hotkey.bind(hyper, "Right", function()
        local win = hs.window.focusedWindow()
        if win then
            win:moveToUnit(hs.layout.right50)
        end
    end)
end

-- Application Management
local function setupAppManager()
    local function openApp(name)
        local app = hs.application.find(name)
        if app and app:isFrontmost() then
            app:hide()
            return
        end
        hs.application.launchOrFocus(name)
    end

    local function mountApp(appName)
        return function()
            openApp(appName)
        end
    end

    -- App shortcuts
    hs.hotkey.bind(hyper, "c", mountApp("Google Chrome"))
    hs.hotkey.bind(hyper, "j", mountApp("IntelliJ IDEA"))
    hs.hotkey.bind(hyper, "s", mountApp("Slack"))
    hs.hotkey.bind(hyper, "g", mountApp("Craft"))
    hs.hotkey.bind(hyper, "t", mountApp("Alacritty"))
end

-- External Modules
local function setupExternalModules()
    local pocket = require("pocket")

    -- Pocket integration
    hs.hotkey.bind(hyper, "p", function()
        local url = hs.pasteboard.getContents()
        pocket.addToPocket(url)
    end)
end

-- Utility Functions
local function setupUtilityHotkeys()
    -- Reload config
    hs.hotkey.bind(hyper, "r", function()
        hs.reload()
    end)

    -- Open Console
    hs.hotkey.bind(hyper, '6', function()
        hs.console.hswindow():focus()
    end)
end

-- Notification Setup
local function runStartupNotification()
    hs.notify.new({
        title = "Hammerspoon",
        informativeText = "Hammerspoon is ready",
        autoWithdraw = true,
        hasActionButton = false
    }):send()
end

local function setupNetworkMonitor()
    require("network_monitor").setup()
end

-- Initialize
local function init()
    setupUIStyle()
    setupWindowManager()
    -- setupAppManager()
    setupUtilityHotkeys()
    setupNetworkMonitor()
    -- setupExternalModules()
    runStartupNotification()
end

init()
