extends Node

onready var playerFlag = get_node_or_null("PlayerFlag")
onready var wallFlag = get_node_or_null("WallFlag")
const mainMenu = "res://Scenes/Levels/MainMenu.tscn"
var music = AudioStreamPlayer2D.new()
var flagSound = preload("res://Audio/pleasing-bell.wav")
var totalFlags = 0
var flags = 0

func _ready():
	add_child(music)
	
	if playerFlag != null :
		totalFlags += 1
		
	if wallFlag != null :
		totalFlags += 1

func _process(_delta):
	
	if Input.is_action_just_pressed("restart"):
		var _reload = get_tree().reload_current_scene()
	
	if Input.is_action_just_pressed("quit"):
		var _endGame = get_tree().change_scene(mainMenu)
	
	if flags == totalFlags :
		var levelName = get_tree().get_current_scene().get_name()
		var levelNum = levelName.right(5)
		
		if levelNum == "16" :
			var _endGame = get_tree().change_scene(mainMenu)
		else:
			var levelString = "res://Scenes/Levels/Level" + str(int(levelNum)+1) + ".tscn"
			var _nextLevel = get_tree().change_scene(levelString)

func _on_PlayerFlag_body_entered(body):
	if body.name == "Player":
		flags += 1
		if !music.is_playing():
				music.stream = flagSound
				music.play()
				yield(music, "finished")

func _on_WallFlag_body_entered(body):
	if body.name == "PlayerWall":
		flags += 1
		if !music.is_playing():
				music.stream = flagSound
				music.play()
				yield(music, "finished")

func _on_PlayerFlag_body_exited(body):
	if body.name == "Player":
		flags -= 1

func _on_WallFlag_body_exited(body):
	if body.name == "PlayerWall":
		flags -= 1
