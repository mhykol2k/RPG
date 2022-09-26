extends Control

var armour = 4 setget set_armour
var max_armour = 4 setget set_max_armour

onready var armourUIFull = $ArmourUIFull
onready var armourUIEmpty = $ArmourUIEmpty

func set_armour(value):
	armour = clamp(value, 0, max_armour)
	if armourUIFull != null:
		armourUIFull.rect_size.x = armour * 16
	
func set_max_armour(value):
	max_armour = max(value, 1)
	self.armour = min(armour, max_armour)
	if armourUIEmpty != null:
		armourUIEmpty.rect_size.x = max_armour * 16
	
func _ready():
	self.max_armour = PlayerStats.max_armour
	self.armour = PlayerStats.armour
# warning-ignore:return_value_discarded
	PlayerStats.connect("armour_changed", self, "set_armour")
# warning-ignore:return_value_discarded
	PlayerStats.connect("max_armour_changed", self, "set_max_armour")
