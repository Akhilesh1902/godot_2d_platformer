extends Area2D

func _on_body_entered(body):
	GameManager.updateKey(1)
	await get_tree().create_timer(.05).timeout
	queue_free()
