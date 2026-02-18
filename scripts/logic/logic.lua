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
    if has("dm") then
        local item = Tracker:FindObjectForCode("missile")
        local count = Tracker:ProviderCountForCode("missile")
        count = count + Tracker:ProviderCountForCode("Missile_Data_Size")
        item.AcquiredCount = count
    end
end

function setSizePB()
    local item = Tracker:FindObjectForCode("pbomb")
    item.Increment=Tracker:ProviderCountForCode("PB_Tank_Size")
    item.Decrement=Tracker:ProviderCountForCode("PB_Tank_Size")
end


function addDataPB()
    if has("pb") then
        local item = Tracker:FindObjectForCode("pbomb")
        local count = Tracker:ProviderCountForCode("pbomb")
        count = count + Tracker:ProviderCountForCode("PB_Data_Size")
        item.AcquiredCount = count
    end
end

 function isStartingLocation(number)
    print(Tracker:FindObjectForCode("Starting Location").CurrentStage)
    local Start = Tracker:FindObjectForCode("Starting Location").CurrentStage
    number = tonumber(number)
    if number == Start then
        return true
    else 
        return false
    end
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

function cannotJumpHigh()
    if canJumpHigh() then
        return false
    else return true
    end
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

function cannotBombOrPowerBomb()
    if canBombOrPowerBomb() then
        return false
    else return true
    end
end


function canBeatToughEnemy()
    return has("bc") or has("dm") or has("screw") or canPowerBomb()
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
    return has("screw") or has("dm") or has("bc") or canPowerBomb()
end

function canDefeatThirdStabilizer()
    if has("dm") or has("bc") or canPowerBomb() then
        return true
    end
    if has("screw") then
        if has("high") then
            return canWallJump(1)
        else return canWallJump(2)
        end
    end
end

function canWallJump(Diff)
    Diff=tonumber(Diff)
    local WalljumpOption=Tracker:FindObjectForCode("Walljumps").CurrentStage
    if Diff>WalljumpOption then
        return AccessibilityLevel.SequenceBreak
    else
        return true
    end
end

function canShinespark(Diff)
    if hasnot("speed") then
        return false
    end
    Diff=tonumber(Diff)
    local ShinesparkOption=Tracker:FindObjectForCode("Shinesparks").CurrentStage
    if Diff>ShinesparkOption then
        return AccessibilityLevel.SequenceBreak
    else
        return true
    end
end

function canPoNR(item)
    if has("PoNR") then
        return true
    end
    item=tostring(item)
    if has(item) then
        return true
    else return AccessibilityLevel.SequenceBreak
    end
end

function canFightBoss()
    local Diff=Tracker:FindObjectForCode("Combat").CurrentStage

    if has("dm") then
        if (has("etank", 3) or Diff>1) and has("bc") then
            return true
        else return AccessibilityLevel.SequenceBreak
        end
    else return false
    end
end

function canFightMidgameBoss()
    local Diff=Tracker:FindObjectForCode("Combat").CurrentStage
    if Diff>0 then
        return canFightBoss()
    end
    if has("dm") and has("etank", 5) and has("bc") and has("ms") then
        return true
    else if canFightBoss() then
        return AccessibilityLevel.SequenceBreak
        end
    end
end

function canFightLategameBoss()
    local Diff=Tracker:FindObjectForCode("Combat").CurrentStage
    if Diff>1 then
        return canFightBoss()
    end

    if Diff >0 then
        if has("dm") and has("etank", 5) and has("bc") and has("ms") then
            return true
        else if canFightBoss() then
            return AccessibilityLevel.SequenceBreak
        end
        end
    end 

    if has("bp") and has("space") and has("dm") and has("etank", 7) and has("bc") and has("ms") then
        return true
    else if canFightMidgameBoss() then
        return AccessibilityLevel.SequenceBreak
        end
    end
end

function canFreezeEnemies()
    return has("bi") or (has("dm") and (has("mi") or has("md")))
end

function cannotFreezeEnemies()
    if canFreezeEnemies() then
        return false
    else return true
    end
end

function canBreakBombBlocks()
    return has("screw") or canBombOrPowerBomb()
end

function canReachAnimals()
    return (has("speed") or has("bw")) and ((canFreezeEnemies() and has("high")) or has"space")
end

function canAccessArachnusZone()
    return (canDefeatSmallGeron() and (has("dm") or has("bc"))) or (has("mb") and has("screw") and (canJumpHigh() or canWallJump(1)))
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

function canAccessWateringHole()
    if has("gravity") and has("speed") and has("mb") and canBallJump() then
        if has("bc") or has("bp") or has("screw") then
            return true
        else 
            if has("dm") or has("bw") or has("bi") or has("pb") then
                return canShinespark(1)
            else 
                return canShinespark(2) 
            end
        end
    else
        return false
    end
end

function canAccessSec4LowerSecZoneWithoutK4()
    return has("dm") and canBreakBombBlocks() and has("gravity") and has("mb")
end


function canAccessFieryStorageFromSector3()
    return has("varia") and (canLavaDive() or canBeatToughEnemy() or canShinespark(1))
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
    if (has("speed") and has("k1") and canBallJump()) and (has("bw") or canPowerBomb() or (has("dm") and has("ms")) or has("screw")) then
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


function canGetSpeedboosterLowerItem()
    if has("speed") and has("screw") then
        if has("space") then
            if has("high") then
                return true
            else return AccessibilityLevel.SequenceBreak
            end
        else return AccessibilityLevel.Inspect
        end
    else return false
    end
end

function canGetKagoRoomItem()
    if has("screw") or canJumpHigh() or canFreezeEnemies() then
        return true
    end
    if canShinespark(1) then
        return canShinespark(1)
    else
        return AccessibilityLevel.Inspect
    end
end

function canGetOasisStorageItem()
    if canPowerBomb() or (canBombOrPowerBomb() and has("high")) or (canJumpHigh() and has("gravity") and has("screw")) then
        return true
    end
    if (has("gravity") and has("mb") and has("bomb")) or (has("gravity") and has("screw") and canActivatePillar()) then
        return AccessibilityLevel.SequenceBreak
    end
    if canActivatePillar() then
        return AccessibilityLevel.Inspect
    else return false
    end
end

function canGetSector3SecurityAccessItem()
    if canBeatToughEnemy() and canJumpHigh() then
        return canBeatToughEnemy()
    else
        return AccessibilityLevel.Inspect
    end
end


function needEtanks(amount)
    amount=tonumber(amount)
    local CombatDiff=Tracker:FindObjectForCode("Combat").CurrentStage
    if CombatDiff>1 then
        amount=amount/2
    end
    if has("ElevatorRandom") then
        amount=amount/2
    end
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
