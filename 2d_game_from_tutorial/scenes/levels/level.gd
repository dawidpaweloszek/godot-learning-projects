extends Node2D

var laser_scene: PackedScene = preload("res://scenes/projectiles/laser.tscn")
var granade_scene: PackedScene = preload("res://scenes/projectiles/granade.tscn")

func _on_gate_player_entered_gate(_body):
	print("Player entred the gate")


func _on_player_laser_signal(laser_pos, player_look_dir):
	var laser := laser_scene.instantiate()
	laser.position = laser_pos
	laser.direction = player_look_dir
	laser.rotation_degrees = rad_to_deg(player_look_dir.angle())
	
	$Projectiles.add_child(laser)


func _on_player_granade_signal(granade_pos, player_look_dir):
	var granade: RigidBody2D = granade_scene.instantiate() as RigidBody2D
	granade.position = granade_pos
	granade.linear_velocity = player_look_dir * granade.speed
	
	$Projectiles.add_child(granade)
