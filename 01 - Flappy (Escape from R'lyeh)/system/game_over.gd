extends CanvasLayer

@onready var animationPlayer:AnimationPlayer = %AnimationPlayer
@onready var score:Label = %LblScore
@onready var sfx:AudioStreamPlayer = %SFX

func _ready():
	animationPlayer.play("default")
	score.text = str(GameManager.score)

func _on_btn_restart_button_up():
	sfx.play()
	await get_tree().create_timer(0.7).timeout
	animationPlayer.play_backwards("default")
	queue_free()
	GameManager.start_game()

func _on_btn_menu_button_up():
	sfx.play()
	await get_tree().create_timer(0.7).timeout
	animationPlayer.play_backwards("default")
	queue_free()
	get_tree().reload_current_scene()
	GameManager.stop_music()
	GameManager.show_menu()
