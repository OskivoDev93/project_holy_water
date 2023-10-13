extends CharacterBody2D

var speed = 100
var player_chase = false
var player = null

var hit = false
var bullet = null




func _physics_process(delta):
	if player_chase:
		get_parent().position += (player.position - get_parent().position) /speed





func _on_area_2d_body_entered(body):
	player = body
	player_chase = true



func _on_area_2d_body_exited(body):
	player = null
	player_chase = false

func _on_hitbox_area_entered(area):
	hit = true
	bullet = area
	print("hit")
	print(bullet)
	queue_free()
