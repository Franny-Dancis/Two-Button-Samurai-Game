extends Node2D


onready var hitTracker = $Label
onready var player = $PlayerHitZone
onready var woodenLog = $Red/Hitzone


# Called when the node enters the scene tree for the first time.
func _physics_process(delta):
	if Input.is_action_just_pressed("Attack"):
		if woodenLog.overlaps_area(player):
			print("Hit!")
			hitTracker.text = "Hit!"
	if Input.is_action_just_pressed("Reload"):
		get_tree().reload_current_scene()
