extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -800.0
const gravity =30
var coin = 0
# Get the gravity from the project settings to be synced with RigidBody nodes.
#var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(_delta):
	
	velocity.x = 0
	
	if Input.is_action_pressed("left"):
		velocity.x -= SPEED
		$playerSprites.flip_h = true
		$playerSprites.play('run')
		
	elif Input.is_action_pressed("right"):
		velocity.x += SPEED
		$playerSprites.flip_h = false
		$playerSprites.play('run')
	else:
		$playerSprites.play('idle')
	if Input.is_action_just_pressed("jump") && is_on_floor():
		velocity.y += JUMP_VELOCITY
	
	else:
		velocity.y += gravity
	if(velocity.y < 0):
		$playerSprites.play('jump')

	move_and_slide()
	


func _on_fall_zone_body_entered(body):
	GameManager.coins= 0
	#queue_free()
	get_tree().change_scene_to_file.bind("res://Scenes/Level1.tscn").call_deferred()

func winning():
	print('winning')
