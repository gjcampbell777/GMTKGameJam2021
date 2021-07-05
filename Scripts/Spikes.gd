extends Area2D

var deathSound = preload("res://Audio/mutantdie.wav")

func _on_Spikes_body_entered(body):
	if body.is_in_group("Player"):
		if !$AudioStreamPlayer2D.is_playing():
			body.hide()
			$AudioStreamPlayer2D.stream = deathSound
			$AudioStreamPlayer2D.play()
			yield($AudioStreamPlayer2D, "finished")
			var _reload = get_tree().reload_current_scene()
