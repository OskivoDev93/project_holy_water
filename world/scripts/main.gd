extends Node2D


@onready var bullets = $bullets
@onready var player = $player
@onready var enemies = $enemies
@onready var spawnTimer = $enemies/Timer

var enemy = preload("res://world/scene/enemies/enemy.tscn")
@export var spawn_rate = 1.0
@export var spawn_limit = 10
@export var nextSpawnTime = 3.0


func _ready():
	
	randomize()
	spawnTimer.start(nextSpawnTime)
	player.get_child(0).get_child(2).connect("bullet_shot", _on_player_bullet_shot)

func _on_player_bullet_shot(bullet):
	bullets.add_child(bullet)

func spawn_enemy():
	var e = enemy.instantiate()
	var viewRect = get_viewport_rect()
	var xPos = randi_range(viewRect.position.x, viewRect.end.x)
	var yPos = randi_range(viewRect.position.y, viewRect.end.y)
	if enemies.get_child_count() < 20:
		e.position = Vector2(xPos, yPos)
		enemies.add_child(e)
	
	spawnTimer.start(nextSpawnTime)
	


func _on_timer_timeout():
	spawn_enemy()
