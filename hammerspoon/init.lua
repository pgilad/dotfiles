local hyper = {"cmd", "alt", "ctrl", "shift"}
local log = hs.logger.new('hammerspoon','debug')

function openApp(name)
    local app = hs.application.find(name)
    log.i("open app", name, app)

    if not app then
        log.i("launching app")
        hs.application.launchOrFocus(name)
        return
    end

    if app:isFrontmost() then
        log.i("hiding app")
        app:hide()
        return
    end

    log.i("focusing app")
    app:mainWindow():focus()
end

function mountApp(appName)
    return function()
        openApp(appName)
    end
end

hs.hotkey.bind(hyper, 'i', mountApp("iTerm2"))
hs.hotkey.bind(hyper, 'c', mountApp("Google Chrome"))
hs.hotkey.bind(hyper, 'j', mountApp("IntelliJ IDEA"))
hs.hotkey.bind(hyper, 's', mountApp("Slack"))

hs.notify.new({title='Hammerspoon', informativeText='Ready to rock 🤘'}):send()
