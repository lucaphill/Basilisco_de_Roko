extends Node2D

const gemini_music = preload("res://assents/music/gemini_st.mp3")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	BackgroundMusic_menu._play_music(gemini_music)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
