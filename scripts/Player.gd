extends CharacterBody2D


const SPEED = 500.0
const JUMP_VELOCITY = -2000.0
const gravity =120
const acceleration  = 50
const friction = 70
const max_jump= 2
var currentJump = 1

var coin = 0
# Get the gravity from the project settings to be synced with RigidBody nodes.
#var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func input() -> Vector2:
	var input_dir = Vector2.ZERO
	input_dir.x = Input.get_axis("left","right")
	input_dir.normalized()
	return input_dir

func accelerate(direction):
	velocity = velocity.move_toward(SPEED*direction,acceleration)

func add_friction():
	velocity = velocity.move_toward(Vector2.ZERO,friction)

func player_movement():
	move_and_slide()

func jump():
	if Input.is_action_just_pressed("jump"):
		if currentJump < max_jump:
			velocity.y = JUMP_VELOCITY
			currentJump += 1
	else:
		velocity.y += gravity
	
	if is_on_floor():
		currentJump =1
	
func _physics_process(_delta):
	
	var input_dir: Vector2 = input()
	
	if input_dir != Vector2.ZERO:
		accelerate(input_dir)
		if(input_dir.x <0):
			$playerSprites.flip_h= true
		else:
			$playerSprites.flip_h= false
			
			
		$playerSprites.play('run')
	else:
		add_friction()
		$playerSprites.play('idle')
		
		
	jump()

	player_movement()

	
	


func _on_fall_zone_body_entered(body):
	GameManager.coins= 0
	#queue_free()
	get_tree().change_scene_to_file.bind("res://Scenes/Level1.tscn").call_deferred()

func winning():
	print('winning')
