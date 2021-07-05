extends KinematicBody2D

var jumpSound = preload("res://Audio/BounceYoFrankie.wav")
var movement = Vector2()
export var speed = 250
export var gravity = 1000
export var jump = -750

func _physics_process(delta):
	if Input.is_action_pressed("right"):
		movement.x = speed
		$AnimatedSprite.flip_h = false
		$AnimatedSprite.play("Walk")
	elif Input.is_action_pressed("left"):
		movement.x = -speed
		$AnimatedSprite.flip_h = true
		$AnimatedSprite.play("Walk")
	else:
		$AnimatedSprite.play("Idle")
	
	if is_on_floor() :
		movement.y = 0
	
	movement.y += gravity * delta
	
	if Input.is_action_just_pressed("jump") and is_on_floor():
		movement.y = jump
		if !$AudioStreamPlayer2D.is_playing():
			$AudioStreamPlayer2D.stream = jumpSound
			$AudioStreamPlayer2D.play()
	
	var _velocity = move_and_slide(movement, Vector2.UP)
	
	movement.x = lerp(movement.x, 0, 0.2)
