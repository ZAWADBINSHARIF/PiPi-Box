extends Area2D

onready var animationPlayer= $AnimationPlayer

export var CoinValue = 100

func _on_body_entered(_body):
	PlayerData.score += CoinValue
	$coinCollect.play()
	animationPlayer.play("Collected")
