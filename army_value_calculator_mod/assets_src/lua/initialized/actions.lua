local Events = require "initialized/events"
local Wargroove = require "wargroove/wargroove"

local Inspect = require("inspect")

local Actions = {}

function Actions.init()
    Events.addToActionsList(Actions)
end

function Actions.populate(dst)
    dst["calculate_army_value"] = Actions.calculateArmyValue
end

function Actions.calculateArmyValue(context)
    local armyValue = { 0, 0, 0, 0, 0, 0, 0, 0 }

    local allUnits = Wargroove.getUnitsAtLocation(nil)

    for i, unit in ipairs(allUnits) do
        local unitClass = Wargroove.getUnitClass(unit.unitClassId)

        if not unitClass.isStructure then 
            armyValue[unit.playerId + 1] = armyValue[unit.playerId + 1] + unitClass.cost * (unit.health/100)
        end
	end

    local outputString = ""

    for i = 1, 8 do
        if armyValue[i] ~= 0 then
            outputString = outputString .. "P" .. i .. ": " .. armyValue[i] .. ", "
        end
    end

    Wargroove.showMessage(outputString)
end


return Actions