extends Area2D

signal coinsCollected(val)

func _on_body_entered(body):
	emit_signal("coinsCollected")
	GameManager.gain_coins(1)
	#print('before wait')
	await get_tree().create_timer(.05).timeout
	#print('after  wait')
	
	queue_free()
	
