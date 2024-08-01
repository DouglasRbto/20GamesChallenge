class_name Player
extends CharacterBody2D

@export var speed:int = 55

func _ready():
	GameManager.player = self
func _physics_process(delta):
	if GameManager.isGameOver:
		return

	velocity.y += speed * 50 * delta

	if Input.is_action_just_pressed("ui_accept") || Input.is_action_just_pressed("click"):
		velocity.y = - speed * 1000 * delta
	
	move_and_slide()
	
func _on_hit_box_body_entered(body):
	if body != self:
		GameManager.game_over()
