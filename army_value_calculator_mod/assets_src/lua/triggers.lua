local Events = require "wargroove/events"
local Wargroove = require "wargroove/wargroove"

local Triggers = {}

function Triggers.calculateArmyValue(referenceTrigger)
	local trigger = {}
	trigger.id = "$trigger_modded_calculate_army_value"
	trigger.enabled = true
	trigger.isIntro = false
	trigger.recurring = "repeat"
	trigger.players = referenceTrigger.players
	trigger.conditions = {}
	trigger.actions = {}

	table.insert(trigger.conditions, { enabled = true, id = "player_turn", parameters = { "current" } })
    table.insert(trigger.conditions, { enabled = true, id = "end_of_unit_turn", parameters = { } })

	table.insert(trigger.actions, { enabled = true, id = "calculate_army_value", parameters = { } })

	return trigger
end

return Triggers