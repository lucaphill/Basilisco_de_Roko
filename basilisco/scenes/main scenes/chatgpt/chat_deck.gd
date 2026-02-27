extends Node2D

const CARD_SCENE_PATH = "res://scenes/card.tscn"
const CARD_DRAW_SPEED = 0.2
const CARD_COUNT = 4


## CARTAS DISPONIVEIS NO DECK
var player_deck = ["oi", "oi", "oi", "oi"]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for i in range(CARD_COUNT):
		draw_card()


# Desenha as cartas
func draw_card():
	var card_scene = preload(CARD_SCENE_PATH)
	var new_card = card_scene.instantiate()
	$"../Chat_cardManager".add_child(new_card)
	new_card.name = "Card"
	$"../Chat_PlayerHand".add_card_to_hand(new_card, CARD_DRAW_SPEED)
