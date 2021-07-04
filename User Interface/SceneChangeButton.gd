tool
extends Button

export(String, FILE) var Next_secne_path = ""


func _get_configuration_warning():
	return "Set The Next Secne Path" if Next_secne_path == "" else ""


func _on_SceneChangeButton_button_up():
	
	return get_tree().change_scene(Next_secne_path)

