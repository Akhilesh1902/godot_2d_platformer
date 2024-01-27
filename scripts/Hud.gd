extends CanvasLayer

var coins =0

# Called when the node enters the scene tree for the first time.
func _ready():
	$CoinsUI.text = str(coins)
	GameManager.updateCoins.connect(update_coins_display)

func update_coins_display(val):
	$CoinsUI.text = str(val)
	
