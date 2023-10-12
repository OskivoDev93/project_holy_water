extends Node2D


@onready var bullets = $bullets
@onready var player = $player

func _ready():
	player.get_child(0).get_child(2).connect("bullet_shot", _on_player_bullet_shot)

func _on_player_bullet_shot(bullet):
	bullets.add_child(bullet)
