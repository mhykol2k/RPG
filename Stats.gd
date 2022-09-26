extends Node

export(int) var max_health = 1 setget set_max_health
var health = max_health setget set_health

export(int) var max_armour = 1 setget set_max_armour
var armour = max_armour setget set_armour

export(int) var max_stamina = 1 setget set_max_stamina
var stamina = max_stamina setget set_stamina

signal no_health
signal no_armour
signal no_stamina

signal max_stamina_changed(value)
signal stamina_changed(value)

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
		
func set_max_stamina(value):
	max_stamina = value
	self.stamina = min(stamina, max_stamina)
	emit_signal("max_stamina_changed", max_stamina)

func set_stamina(value):
	stamina = value
	emit_signal("stamina_changed", stamina)
	if stamina <= 0:
		emit_signal("no_stamina")

func _ready():
	self.health = max_health
	self.armour = max_armour
	self.stamina = max_stamina
