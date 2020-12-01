extends Node

onready var pipe_set = preload("res://Scenes/PipeSet.tscn")
var score = 0

func _ready():
	var _timer = Timer.new()
	add_child(_timer)

	_timer.connect("timeout", self, "_on_Timer_timeout")
	_timer.set_wait_time(2.5)
	_timer.set_one_shot(false) # Make sure it loops
	_timer.start()



func _on_Timer_timeout():
	var birbPos = get_parent().get_node("Bird").position
	var pipe = pipe_set.instance()
	pipe.connect("score", self, "onScore")
	var newPos = Vector2(birbPos.x+200, randi() % (360 - 120) + 120)

	pipe.position = newPos
	get_tree().get_root().add_child(pipe)

func onScore():
	print("score")
	score+=1
	get_parent().get_node("CanvasLayer/Control/ScoreLabel").text = str(score)
