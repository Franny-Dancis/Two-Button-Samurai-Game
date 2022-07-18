extends KinematicBody2D

const TARGET_FPS = 60
const ACCELERATION = 8
const MAX_SPEED = 72
const FRICTION = 10
const AIR_RESISTANCE = 1
const GRAVITY = 4
const JUMP_FORCE = 140

var motion = Vector2.ZERO

onready var sprite = $AnimatedSprite
onready var hitboxPivot = $hitboxPivot
onready var animationTimer = $animationTimer

func _physics_process(delta):
	var x_input = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	
	if Input.is_action_just_pressed("Reload"):
		get_tree().reload_current_scene()
	
	if x_input != 0:
		if is_on_floor():
			sprite.play("Walk")
		motion.x += x_input * ACCELERATION * delta * TARGET_FPS
		motion.x = clamp(motion.x, -MAX_SPEED, MAX_SPEED)
		sprite.flip_h = x_input < 0
	else:
		if is_on_floor() && sprite.get_animation() != "Attack":
			sprite.play("Idle")
			

	if sprite.flip_h == true:
		hitboxPivot.rotation_degrees = 180
	else:
		hitboxPivot.rotation_degrees = 0
		
	motion.y += GRAVITY * delta * TARGET_FPS
	
	if is_on_floor():
		if x_input == 0:
			motion.x = lerp(motion.x, 0, FRICTION * delta)
			
		if Input.is_action_just_pressed("ui_up"):
			motion.y = -JUMP_FORCE		
			sprite.play("Jump")
			
		if Input.is_action_just_pressed("Attack"):
			sprite.play("Attack")
			animationTimer.start()
		
	else:
		if Input.is_action_just_released("ui_up") and motion.y < -JUMP_FORCE/2:
			motion.y = -JUMP_FORCE/2
		
		if x_input == 0:
			motion.x = lerp(motion.x, 0, AIR_RESISTANCE * delta)
	
	#if sprite.current_animation != "Jump" && !is_on_floor():
	#	sprite.play("Fall")
	motion = move_and_slide(motion, Vector2.UP)



func _on_animationTimer_timeout():
	sprite.play("Idle")
