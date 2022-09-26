extends Node

export(int) var max_health = 1 setget set_max_health
var health = max_health setget set_health

export(int) var max_armour = 1 setget set_max_armour
var armour = max_armour setget set_armour

signal no_health
signal no_armour
signal max_health_changed(value)
signal health_changed(value)

signal max_armour_changed(value)
signal armour_changed(value)

func set_max_health(value):
	max_health = value
	self.health = min(health, max_health)
	emit_signal("max_health_changed", max_health)

func set_health(value):
	health = value
	emit_signal("health_changed", health)
	if health <= 0:
		emit_signal("no_health")
		
		
func set_max_armour(value):
	max_armour = value
	self.armour = min(armour, max_armour)
	emit_signal("max_armour_changed", max_armour)

func set_armour(value):
	armour = value
	emit_signal("armour_changed", armour)
	if armour <= 0:
		emit_signal("no_armour")

func _ready():
	self.health = max_health
	self.armour = max_armour
