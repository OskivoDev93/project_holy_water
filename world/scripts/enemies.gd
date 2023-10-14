extends CharacterBody2D

var speed = 100
var player_chase = false
var player = null

var health = 2



func _physics_process(delta):
	if player_chase:
		get_parent().global_position += (player.global_position - get_parent().global_position) / speed
	if health == 0:
		queue_free()





func _on_area_2d_body_entered(body):
	player = body
	player_chase = true



func _on_area_2d_body_exited(body):
	player = null
	player_chase = false

func _on_hitbox_area_entered(area):
	if health > 0:
		health -= 1
		print(health)

