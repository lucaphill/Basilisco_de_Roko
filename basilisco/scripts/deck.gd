'''
NÃO USE ESSE SCRIPT NO SEU BOSS A NÃO SER QUE VC NÃO VÁ MUDAR NADA, CASO NECESSÁRIO FAZER MUDANÇAS,
CREI UM NODE COM O SEU NOME PREFERIDO E COPIE E COLE O CODIGO 
(não é o melhor a longo praso, mas melhor que nada)
'''


extends Node2D

const CARD_SCENE_PATH = "res://scenes/card.tscn"
const CARD_DRAW_SPEED = 0.2


## CARTAS DISPONIVEIS NO DECK
@onready var card_database_reference = preload("res://scripts/Scripts_Solo/Main_card_database.gd")
var player_deck = ["Ex0", "Ex1", "Ex2", "Ex3", "Ex4"] # ELEMENTOS DO DECK, MUDE DE ACORDO COM SUA DATABASE

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player_deck.shuffle() # Randomiza as cartas que vão aparecer
	$RichTextLabel.text = str(player_deck.size())


# Desenha as cartas
func draw_card():
	var card_draw_name = player_deck[0]
	player_deck.erase(card_draw_name)
	
	# Deois de pegar a ultima carta, o deck some
	if player_deck.size() == 0:
		$Area2D/CollisionShape2D.disabled = true # Desativa a colisão com o Deck
		$Sprite2D.visible = false # Faz o deck sumir
		$RichTextLabel.visible = false # desativa o contador
	
	$RichTextLabel.text = str(player_deck.size())
	var card_scene = preload(CARD_SCENE_PATH)
	var new_card = card_scene.instantiate()
	## Imagens das cartas
	var card_image_path = str("res://assents/cads/" + card_draw_name + ".png") #Olha o caminho + nome
	new_card.get_node("CardBase").texture = load(card_image_path)
	
	## Caso tenha colocado propriedades
	#new_card.get_node().text = str(card_database_reference.CARDS[card_draw_name][0])
	#new_card.get_node().text = str(card_database_reference.CARDS[card_draw_name][1])
	$"../CardManager".add_child(new_card)
	new_card.name = "Card"
	$"../PlayerHand".add_card_to_hand(new_card, CARD_DRAW_SPEED)
