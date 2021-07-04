tool
extends Area2D

export var Next_secne: PackedScene

onready var anim_player = $AnimationPlayer

func _on_body_entered(_body):
	teleport()


func _get_configuration_warning():
	return "The Next Secne Property Cannot Be Empty" if not Next_secne else ""

func teleport():
	anim_player.play("Transporting")
	yield(anim_player, "animation_finished")
	return get_tree().change_scene_to(Next_secne)
	

