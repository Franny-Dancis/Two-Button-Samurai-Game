extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Sweet_Spot_area_entered(area):
	print("Sweet Spot Entered")


func _on_Sweet_Spot_area_exited(area):
	print("Sweet Spot Exited")


func _on_Fail2_area_entered(area):
	print("Fail Spot Entered")


func _on_Fail2_area_exited(area):
	print("Sweet Spot Exited")


func _on_Fail_area_entered(area):
	print("Fail Spot Entered")


func _on_Fail_area_exited(area):
	print("Sweet Spot Exited")


func _on_Success_2_area_exited(area):
	print("Success Spot Exited")


func _on_Success_area_exited(area):
	print("Success Spot Exited")


func _on_Success_2_area_entered(area):
	print("Success Spot Entered")


func _on_Success_area_entered(area):
	print("Success Spot Entered")
