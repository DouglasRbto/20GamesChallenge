class_name Pillar
extends RigidBody2D

@export var speed:int = 500
@export var heightVariation:int = 150

func _ready():
	position.y = randi_range(position.y - heightVariation, position.y + heightVariation)

func _physics_process(delta):
	if GameManager.isGameOver == false:
		move_and_collide(Vector2.LEFT * speed * delta)

	if position.x < get_viewport_rect().size.x - get_viewport_rect().size.x - 70:
		queue_free()

func _on_point_area_body_exited(body):
	GameManager.score += 1;
