-- luacheck: globals hs
-- luacheck: globals globals

local keychain = require("keychain")
local logger = hs.logger.new("pocket", "info")

-- keychain:addItem{ account = "consumer_key", service = "hammerspoon.pocket", password = "abc"}
-- keychain:addItem{ account = "access_token", service = "hammerspoon.pocket", password = "abc"}

local pocket_consumer_key =
    keychain:getItem {
    account = "consumer_key",
    service = "hammerspoon.pocket"
}

local pocket_access_token =
    keychain:getItem {
    account = "access_token",
    service = "hammerspoon.pocket"
}

local pocketAPI = {
    add = "https://getpocket.com/v3/add"
}

local function isURL(url)
    return string.match(url, "www") or string.match(url, "http://") or string.match(url, "https://")
end

local function addToPocket(url)
    if not isURL(url) then
        logger.i("Invalid url: " .. url .. ".")
        hs.notify.new(
            {
                title = "Hammerspoon",
                subtitle = "Skipping",
                informativeText = "Did not detect a url to add to Pocket",
                autoWithdraw = true
            }
        ):send()
        return
    end

    logger.i("Saving url to pocket: " .. url)

    hs.http.asyncPost(
        pocketAPI.add,
        hs.json.encode(
            {
                url = hs.http.encodeForQuery(url),
                consumer_key = pocket_consumer_key.password,
                access_token = pocket_access_token.password
            }
        ),
        {["Content-Type"] = "application/json; charset=UTF-8"},
        function(status, _, _)
            if not status or status ~= 200 then
                logger.e("Error (" .. status .. ") while adding url (" .. url .. ") to Pocket.")
            else
                local message = "Added " .. url .. " to Pocket"
                logger.i(message)
                hs.alert.show(message)
            end

            hs.window.frontmostWindow():focus() -- Always focus frontmost window before returning
        end
    )
end

return {
    addToPocket = addToPocket
}
