class_name GameUI
extends CanvasLayer

var score:int = 0
@onready var scoreLabel:Label = %ScoreLabel

func _ready():
	GameManager.gameUi = self
	
func _process(_delta):
	scoreLabel.text = str(GameManager.score)
