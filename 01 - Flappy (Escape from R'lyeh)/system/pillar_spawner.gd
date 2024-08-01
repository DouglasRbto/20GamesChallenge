class_name PillarSpawner
extends Node

@export var spawnDelay:float = 1
@export var enabled:bool = false
@export var spawnCooldown:float = 2
@onready var pillar:PackedScene = load("res://objects/pillar.tscn")

func _ready():
	GameManager.spawner = self
	
func _process(delta):
	if GameManager.isGameOver || !enabled:
		return;
		
	spawnCooldown += delta
	if spawnCooldown >= spawnDelay:
		var p = pillar.instantiate()
		p.position = self.position;
		add_sibling(p)
		spawnCooldown = 0
