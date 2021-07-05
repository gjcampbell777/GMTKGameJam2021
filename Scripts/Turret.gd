extends StaticBody2D

var fireSound = preload("res://Audio/foom_0.wav")
var _timer = null
onready var fireBall = preload("res://Scenes/Fireball.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	_timer = Timer.new()
	add_child(_timer)
	
	_timer.connect("timeout", self, "_on_Timer_timeout")
	_timer.set_wait_time(1.5)
	_timer.set_one_shot(false) # Make sure it loops
	_timer.start()

func _on_Timer_timeout():
	var test = fireBall.instance()
	add_child(test)
	test.position = Vector2(-65,0)
	$AudioStreamPlayer2D.stream = fireSound
	$AudioStreamPlayer2D.set_volume_db(-25)
	$AudioStreamPlayer2D.play()
