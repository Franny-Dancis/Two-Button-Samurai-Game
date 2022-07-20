extends Node2D


onready var pointCounter = $Points
var points = 0

# Called when the node enters the scene tree for the first time.
func _physics_process(delta):
	if Input.is_action_just_pressed("Attack"):
		$Slider/AnimationPlayer.stop()
		if $Slider/Hitbox.overlaps_area($"GaugeNoCrit/Sweet Spot"):
			points += 10
			print("Great hit!")
		if $Slider/Hitbox.overlaps_area($"GaugeNoCrit/Fail2"):
			points += 0
			print("Fail.")
		if $Slider/Hitbox.overlaps_area($"GaugeNoCrit/Fail"):
			points += 0
			print("Fail.")
		if $Slider/Hitbox.overlaps_area($"GaugeNoCrit/Success"):
			points += 5
			print("Success!")
		if $Slider/Hitbox.overlaps_area($"GaugeNoCrit/Success 2"):
			points += 5
			print("Success!")
	pointCounter.text = str(points)
	$Slider/AnimationPlayer.play("Move")
