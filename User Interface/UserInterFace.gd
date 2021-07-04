extends Control

onready var scene_tree = get_tree()
onready var scoreText = $Label
onready var pauseMenu = $ColorRect
onready var tittle = $ColorRect/Tittle

var paused = false setget set_pause
var die = "You Die"

func _ready():
	PlayerData.connect("change_score", self, "update_score")
	PlayerData.connect("change_dead", self, "update_dead")
	update_score()

func update_score():
	scoreText.text = "Score : %s" % PlayerData.score

func update_dead():
	self.paused = true
	tittle.text = die

func _unhandled_input(event):
	if event.is_action_released("pause") and tittle.text != die:
		self.paused =  not paused
		scene_tree.set_input_as_handled()
		
func set_pause(value):
	paused = value
	pauseMenu.visible = value
	scene_tree.paused = value
	
func _on_SceneChangeButton_button_up():
	self.paused = false
