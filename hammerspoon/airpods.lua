local bluetooh = {}

local bluetoothApp = "/usr/local/bin/blueutil"

function getId(deviceName)
    local output = hs.execute(bluetoothApp .. " --paired --format new-default | grep '" .. deviceName .. "' | cut -d, -f1 | cut -d ' ' -f2")
    return output
end

function trim(s)
   return (s:gsub("^%s*(.-)%s*$", "%1"))
end

function bluetooth(deviceName)
  local deviceId = getId(deviceName)
  if deviceId == nil or deviceId == "" then
      hs.alert.show("Could not find device " .. deviceName)
      return
  end
  local isConnectedOutput = hs.execute(bluetoothApp .. " --is-connected " .. deviceId)
  isConnected = tonumber(isConnectedOutput) == 1

  if isConnected then
    local output = hs.execute(bluetoothApp .. " --disconnect " .. deviceId)
    hs.alert.show("Disconnected from " .. deviceName)
  else
    local output = hs.execute(bluetoothApp .. " --connect " .. deviceId)
    hs.alert.show("Connected to " .. deviceName)
  end
end

return {
    toggle = bluetooth
}
