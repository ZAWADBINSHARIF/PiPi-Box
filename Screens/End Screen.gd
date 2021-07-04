extends Control

func _ready():
	var labelText = $Label
	labelText.text = labelText.text % [PlayerData.score, PlayerData.dead]


func _on_SceneChangeButton_button_up():
	PlayerData.score = 0
	PlayerData.dead = 0
