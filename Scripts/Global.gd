extends Node

# Called when the node enters the scene tree for the first time.
func _ready():
	var music = AudioStreamPlayer2D.new()
	add_child(music)
	music.stream = load("res://Audio/happy_adveture.mp3")
	music.set_volume_db(5)
	music.play()
