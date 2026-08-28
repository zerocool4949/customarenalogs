local function OnEvent(self, event, ...)
  if event == "ZONE_CHANGED_NEW_AREA" then
    local type = select(2, IsInInstance())

    if type == "arena" then
      LoggingCombat(true)
      print("CustomArenaLogs: Combat logging has been enabled. Good luck!")
      return
    end

    local _, instanceType = GetInstanceInfo();
    if (instanceType == "pvp") then
      LoggingCombat(true)
      print("CustomArenaLogs: Combat logging has been enabled. Good luck!")
      return
    end

  end
end

local function OnInitialize()
  print("CustomArenaLogs Loaded. Your arena combats will be automatically logged.")
end

local loadFrame = CreateFrame("Frame")
loadFrame:RegisterEvent("PLAYER_LOGIN")
loadFrame:SetScript("OnEvent", OnInitialize)

SLASH_CAL1 = "/cal"
SlashCmdList["CAL"] = function(msg)
  msg = (msg or ""):lower():trim()

  if msg == "start" then
    LoggingCombat(true)
    print("CustomArenaLogs: Combat logging manually started.")
  elseif msg == "stop" then
    LoggingCombat(false)
    print("CustomArenaLogs: Combat logging manually stopped.")
  else
    print("CustomArenaLogs: Usage - /cal start or /cal stop")
  end
end

local eventFrame = CreateFrame("Frame")
eventFrame:RegisterEvent("ZONE_CHANGED_NEW_AREA")
eventFrame:SetScript("OnEvent", OnEvent)