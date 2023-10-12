extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

func _physics_process(delta):
	move()

	move_and_slide()


func move():
	var direction = Input.get_vector("left", "right","up","down")
	velocity = direction * SPEED
