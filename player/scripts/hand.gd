extends Node2D


signal bullet_shot

@onready var spawnPoint = $CharacterBody2D/bulletSpawnPoint
var bulletScene = preload("res://player/scene/bullet.tscn")
var bullet_cooldown = false
var fire_rate = 0.2
func _physics_process(delta):
	look_at(get_global_mouse_position())
	if Input.is_action_pressed("shoot"):
		if !bullet_cooldown:
			bullet_cooldown = true
			shoot_bullets()
			await get_tree().create_timer(fire_rate).timeout
			bullet_cooldown = false

func shoot_bullets():
	var b = bulletScene.instantiate()
	b.global_position = spawnPoint.global_position
	b.global_rotation = spawnPoint.global_rotation
	emit_signal("bullet_shot", b)
