extends Node2D

signal score


func _on_Area2D_body_entered(body):
	if body.name=="Bird":
		emit_signal("score")


func _on_VisibilityNotifier2D_screen_exited():
	print("free up pipes")
	queue_free()
