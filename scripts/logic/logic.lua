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

function canFightBoss()
    return (has("dm") and has("bc")) and has("etank", 2)
end

function canFightMidgameBoss()
    return has("ms") and canFightBoss()
end

function canFightLategameBoss()
    return has("bp") and has("space") and canFightMidgameBoss()
end

function canFreezeEnemies()
    return has("bi") or (has("dm") and (has("mi") or has("md")))
end

function canReachAnimals()
    return has("speed") and ((canFreezeEnemies() and has("high")) or has"space")
end

function canAccessArachnusZone()
    return canDefeatSmallGeron() or (has("mb") and has("screw") and has("space"))
end

function canAccessReactorZone()
    return has"mb" and (has("k4") or canPowerBomb()) and has("etank", 5)
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
    local result=(babies>=goal_babies) and has("bc") and has("dm")
    if result then
        if has("go") then
            return result
        else Tracker:FindObjectForCode("go").Active = true
        end
    end
    return result
end



ScriptHost:AddWatchForCode("WatchMTankSize", "Missile_Tank_Size", function(code) setSizeMissile() end)
ScriptHost:AddWatchForCode("WatchMData", "dm", function(code) addDataMissile() end)
ScriptHost:AddWatchForCode("WatchPBTankSize", "PB_Tank_Size", function(code) setSizePB() end)
ScriptHost:AddWatchForCode("WatchPBData", "pb", function(code) addDataPB() end)
