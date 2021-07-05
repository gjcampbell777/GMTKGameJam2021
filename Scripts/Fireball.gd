extends Area2D

var deathSound = preload("res://Audio/mutantdie.wav")
var velocity = Vector2()
export var speed = -250

func _physics_process(delta):
	velocity.x = speed * delta
	translate(velocity)

func _on_Fireball_body_entered(body):
	if body.name == "Player":
		if !$AudioStreamPlayer2D.is_playing():
			body.hide()
			$AudioStreamPlayer2D.stream = deathSound
			$AudioStreamPlayer2D.play()
			yield($AudioStreamPlayer2D, "finished")
			var _reload = get_tree().reload_current_scene()
	
	if body.name != "Fireball" :
		queue_free()

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
