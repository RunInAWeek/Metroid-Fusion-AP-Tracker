-- put logic functions here using the Lua API: https://github.com/black-sliver/PopTracker/blob/master/doc/PACKS.md#lua-interface
-- don't be afraid to use custom logic functions. it will make many things a lot easier to maintain, for example by adding logging.
-- to see how this function gets called, check: locations/locations.json
-- example:

function has(item, amount)
    local count = Tracker:ProviderCountForCode(item)
    if not amount then
        return count > 0
    else
        amount = tonumber(amount)
        return count >= amount
    end
end

function hasnot(item)
	local count2 = Tracker:ProviderCountForCode(item)
    if count2 > 0 then
		return false
	else return true
	end
end


function morph()
       
    return has("mb")
end


function var()
     return has("varia")
end


function grav()
    return has("gravity")
end


function hi()
 return has("high")
end


function spa()
  return has("space")
end



function scr()
    return has("screw")
end



function datam()
    return has("dm")
end



function charge()
    return has("bc")
end


function setSizeMissile()
    local item = Tracker:FindObjectForCode("missile")
    item.Increment=Tracker:ProviderCountForCode("Missile_Tank_Size")
    item.Decrement=Tracker:ProviderCountForCode("Missile_Tank_Size")
end


function addDataMissile()
    local item = Tracker:FindObjectForCode("missile")
    local count = Tracker:ProviderCountForCode("missile")
    count = count + Tracker:ProviderCountForCode("Missile_Data_Size")
    item.AcquiredCount = count
end

function setSizePB()
    local item = Tracker:FindObjectForCode("pbomb")
    item.Increment=Tracker:ProviderCountForCode("PB_Tank_Size")
    item.Decrement=Tracker:ProviderCountForCode("PB_Tank_Size")
end


function addDataPB()
    local item = Tracker:FindObjectForCode("pbomb")
    local count = Tracker:ProviderCountForCode("pbomb")
    count = count + Tracker:ProviderCountForCode("PB_Data_Size")
    item.AcquiredCount = count
end

 

function canBallJump()
    return has("mb") and (has("high") or has("bomb"))
end

function canBallJumpAndBomb()
    return (has("high") and canPowerBomb()) or (has("mb") and has("bomb"))
end

function canJumpHigh()
    return has("high") or has("space")
end

function canLavaDive()
    return has("varia") and has("gravity")
end

function canSpeedBoostUnderWater()
    return has("gravity") and has("speed")
end

function canBomb()
    return has("mb") and has("bomb")
end

function canPowerBomb()
    return has("mb") and has("pb")
end

function canPowerBombAndJumpHigh()
    return has("mb") and has("pb") and canJumpHigh()
end

function canBombOrPowerBomb()
    return has("mb") and (has("bomb") or has("pb"))
end

function canBeatToughEnemy()
    return has("bc") or has("dm")
end

function canDefeatSmallGeron()
    return has("dm") or canPowerBomb() or has("screw")
end

function canDefeatMediumGeron()
    return (has("dm") and has("ms")) or canPowerBomb() or has("screw")
end

function canDefeatLargeGeron()
    return canPowerBomb() or has("screw")
end

function canDefeatStabilizers()
    return has("screw") or has("dm") or has("bc")
end

function canFightBoss()
    if has("dm") then
        if has("etank", 2) and has("bc") then
            return true
        else return AccessibilityLevel.SequenceBreak
        end
    else return false
    end
end

function canFightMidgameBoss()
    if has("dm") and has("etank", 2) and has("bc") and has("ms") then
        return true
    else if canFightBoss() then
        return AccessibilityLevel.SequenceBreak
        end
    end
end

function canFightLategameBoss()
    if has("bp") and has("space") and has("dm") and has("etank", 2) and has("bc") and has("ms") then
        return true
    else if canFightMidgameBoss() then
        return AccessibilityLevel.SequenceBreak
        end
    end
end

function canFreezeEnemies()
    return has("bi") or (has("dm") and (has("mi") or has("md")))
end

function canBreakBombBlocks()
    return has("screw") or canBombOrPowerBomb()
end

function canReachAnimals()
    return (has("speed") or has("bw")) and ((canFreezeEnemies() and has("high")) or has"space")
end

function canAccessArachnusZone()
    return canDefeatSmallGeron() or (has("mb") and has("screw") and (has("space") or has(SimpleWalljumps)))
end

function canAccessReactorZone()
    if has"mb" and (has("k4") or canPowerBomb()) then
        if has("etank", 5) then
            return true
        else return AccessibilityLevel.SequenceBreak
        end
    else return false
    end
end

function canAccessSec4LowerSecZoneWithoutK4()
    return has("dm") and canBreakBombBlocks() and has("gravity") and has("mb")
end


function canAccessFieryStorageFromSector3()
    return has("varia") and (canLavaDive() or canBeatToughEnemy())
end

function canAccessSanctuaryCache()
    return (has("bw") and has("bc")) or (has("bw") and has("dm") and has("mb")) or (has("pb") and has("dm") and has("mb")), (has("pb") and has("bc") and has("mb"))
end

function canActivatePillar()
    return has("bw") or canBombOrPowerBomb()
end

function canFinish()
    local goal_babies=Tracker:ProviderCountForCode("needed_metroids")
    local babies=Tracker:ProviderCountForCode("metroid")
    goal_babies=tonumber(goal_babies)
    babies=tonumber(babies)
    local result=(babies>=goal_babies) and has("bc") and has("dm") and canJumpHigh()
    if result then
        if has("go") then
            return result
        else Tracker:FindObjectForCode("go").Active = true
        end
    end
    return result
end


function canAccessLevel4SecurityRoom()
    if (has("dm") and canBombOrPowerBomb) or has("k4") then
        if has("space") then
            return true
        else return AccessibilityLevel.SequenceBreak
        end
    else return false
    end
end

function canAccessReservoirVaultLowerItem()
    if canJumpHigh() then
        if has("dm") and canBombOrPowerBomb() then
            return true
        else return AccessibilityLevel.Inspect
        end
    else return false
    end
end

function canAccessDrainPipe()
    if hasnot("mb") then
        return false
    end
    if (has("speed") and has("k1")) and (has("bw") or canPowerBomb() or (has("dm") and has("ms")) or has("screw")) then
        return true
    end
    if has("etank", 2) and (has("bw") or canPowerBomb() or (has("dm") and has("ms")) or (has("screw") and has("gravity"))) then
        return AccessibilityLevel.SequenceBreak
    end
    return false
end


function canSee()
    return AccessibilityLevel.Inspect
end

function canSB()
    return AccessibilityLevel.SequenceBreak
end

function needEtanks(amount)
    amount=tonumber(amount)
    local count=Tracker:ProviderCountForCode("etank")
    if amount > count then
        return AccessibilityLevel.SequenceBreak
    else return true
    end
end




ScriptHost:AddWatchForCode("WatchMTankSize", "Missile_Tank_Size", function(code) setSizeMissile() end)
ScriptHost:AddWatchForCode("WatchMData", "dm", function(code) addDataMissile() end)
ScriptHost:AddWatchForCode("WatchPBTankSize", "PB_Tank_Size", function(code) setSizePB() end)
ScriptHost:AddWatchForCode("WatchPBData", "pb", function(code) addDataPB() end)
