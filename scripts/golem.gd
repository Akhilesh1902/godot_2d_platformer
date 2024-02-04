extends CharacterBody2D


const SPEED = 100.0
const JUMP_VELOCITY = -400.0
const gravity =120

@export var direction = 1

# Get the gravity from the project settings to be synced with RigidBody nodes.
func _ready():
	if direction == 1:
		$Golem.flip_h = true
	$floorChecker.position.x = $CollisionShape2D.shape.get_rect().size.x * direction
	

func _physics_process(delta):
	$Golem.play('run')
	velocity.y += gravity
	velocity.x = SPEED * direction
	if !$floorChecker.is_colliding():
		direction = direction * -1
		$Golem.flip_h = not $Golem.flip_h
		$floorChecker.position.x = $CollisionShape2D.shape.get_rect().size.x * direction
	#if !$leftEdge.is_colliding() :
		#direction = -1
	#if !$rightEdge.is_colliding() :
		#direction = 1
	move_and_slide()
