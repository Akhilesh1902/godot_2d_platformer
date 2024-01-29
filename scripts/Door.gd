extends Node2D

func _on_area_2d_body_entered(body):
	if(GameManager.keys > 0):
		$Collider/CollisionShape2D.set_deferred('disabled',true)
		$Area2D/Sprite2D.visible = false
		GameManager.updateKey(-1)


func win_area(body):
	get_tree().change_scene_to_file.bind("res://Scenes/Level1.tscn").call_deferred()
