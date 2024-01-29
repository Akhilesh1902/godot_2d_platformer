extends Node

signal updateCoins(coins)
signal updateKeySignal(key)

var coins :int
var keys =0

func gain_coins(val):
	coins +=val
	emit_signal("updateCoins",coins)

func updateKey(val):
	keys += val
	emit_signal("updateKeySignal",keys)
