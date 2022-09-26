extends KinematicBody2D

onready var stats = $Stats
onready var hurtbox = $Hurtbox

func _on_Hurtbox_area_entered(_area):
	if PlayerStats.health == PlayerStats.max_health:
		queue_free()
	else:
		PlayerStats.health += 1
		queue_free()
