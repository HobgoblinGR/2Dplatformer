extends Node2D


var Enemy = preload("res://2Dplatformer/enemy.tscn")

func _on_SpawnTimer_timeout():
	var enemy = Enemy.instance()
	add_child(enemy)
	enemy.position = $Spawn.position
