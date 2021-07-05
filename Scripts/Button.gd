extends Area2D

var pressSound = preload("res://Audio/Metal Click.wav")
var pressed = false
onready var gate = get_node("Gate")

func _process(_delta):
	if !pressed and get_node_or_null("Gate") == null:
		add_child(gate)
	elif pressed and get_node_or_null("Gate") != null :
		remove_child(gate)

func _on_Button_body_entered(body):
	if body.name == "Player":
		if !$AudioStreamPlayer2D.is_playing():
			$AudioStreamPlayer2D.stream = pressSound
			$AudioStreamPlayer2D.play()
		match pressed:
			true:
				pressed = false
				$Sprite.texture = load("res://Sprites/Button.png")
			false:
				pressed = true
				$Sprite.texture = load("res://Sprites/ButtonPressed.png")
