extends CanvasLayer

@onready var animationPlayer:AnimationPlayer = %AnimationPlayer
@onready var creditsPanel:Panel = %Credits
@onready var settingsPanel:Panel = %Settings
@onready var sfx:AudioStreamPlayer = %SFX

var currentActiveMenu:String

func _ready():
	animationPlayer.play("default")

func _on_btn_play_button_up():
	sfx.play()
	animationPlayer.play_backwards("default")
	GameManager.start_game()
	await animationPlayer.animation_finished
	queue_free()

func _on_btn_credits_button_up():
	show_or_hide_menu("credits")
	
func _on_btn_settings_button_up():
	show_or_hide_menu("settings")
	
func show_or_hide_menu(menu:String):
	sfx.play()
	if currentActiveMenu != "":
		animationPlayer.play_backwards(currentActiveMenu)
		await animationPlayer.animation_finished
		settingsPanel.visible = false
		creditsPanel.visible = false
	if menu == currentActiveMenu:
		currentActiveMenu = ""
		return
		
	match menu:
		"settings":
			settingsPanel.visible = true
			animationPlayer.play(menu)
		"credits":
			creditsPanel.visible = true
			animationPlayer.play(menu)
			
	currentActiveMenu = menu	
