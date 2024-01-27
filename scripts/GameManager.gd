extends Node

signal updateCoins(coins)

var coins :int

func gain_coins(val):
	coins +=val
	emit_signal("updateCoins",coins)
