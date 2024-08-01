extends Node

var score:int
var isGameOver:bool = false
@onready var player:Player
@onready var spawner:PillarSpawner
@onready var gameUi:GameUI
@onready var countdown:PackedScene = load("res://scenes/countdown.tscn")
@onready var gameOverUI:PackedScene = load("res://ui/game_over.tscn")
@onready var gameMenu:PackedScene = load("res://ui/main_menu.tscn")
@onready var musicPlayer:PackedScene = load("res://ui/music.tscn")

func _ready():
	await get_parent().ready
	show_menu()

func show_menu():
	var menu = gameMenu.instantiate()
	add_sibling(menu)
	
func start_game():
	if isGameOver:
		get_tree().reload_current_scene()
			
	play_music()
	
	var countdownScene = countdown.instantiate()
	add_sibling(countdownScene)
	await countdownScene.tree_exited
	score = 0
	gameUi.visible = true
	player.speed = 55
	spawner.enabled = true
	isGameOver = false
	
func game_over():
	var gameOverScene = gameOverUI.instantiate()
	add_sibling(gameOverScene)
	isGameOver = true
	gameUi.visible = false
	
func play_music():
	stop_music()
	var music = musicPlayer.instantiate()
	add_child(music)

func stop_music():
	if get_child_count() > 0:
		get_child(0).queue_free()
