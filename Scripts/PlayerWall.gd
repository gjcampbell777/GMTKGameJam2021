extends KinematicBody2D

var noRot = false
export var speed = 5

func _ready():
	noRot = false 

func _physics_process(_delta):
	
	var _velocity = move_and_slide((get_global_mouse_position() - global_position) * speed)
	
	if Input.is_action_just_pressed("click") and !noRot :
		rotate(deg2rad(90))

func _on_Area2D_body_entered(body):
	if body.name == "Player" :
		noRot = true

func _on_Area2D_body_exited(body):
	if body.name == "Player" :
		noRot = false
