extends Node2D


func _ready() -> void:
	pass


func _on_voltar_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main scenes/boss_select.tscn")
