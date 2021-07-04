extends Node

signal change_score
signal change_dead

var score = 0 setget set_score
var dead = 0 setget set_dead

func set_score(value):
	score = value
	emit_signal("change_score")
	
func set_dead(value):
	dead = value
	emit_signal("change_dead")

func restart():
	score = 0
	dead = 0
