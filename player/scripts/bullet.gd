extends Area2D


var movement_vector = Vector2(1, 0)
var speed = 500

func _physics_process(delta):
	global_position += movement_vector.rotated(rotation) * speed * delta


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
