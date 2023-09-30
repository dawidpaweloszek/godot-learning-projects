extends CharacterBody2D

signal laser_signal(laser_pos, player_look_dir)
signal granade_signal(granade_pos, player_look_dir)

var speed: int= 300
var can_laser: bool = true
var can_granade: bool = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	# Input
	var direction: Vector2 = Input.get_vector("left", "right", "up", "down")
	var is_primary_action_pressed: bool = Input.is_action_just_pressed("primary_action")
	var is_secondary_action_pressed: bool = Input.is_action_just_pressed("secondary_action")
	
	# Position
	velocity = direction * speed
	move_and_slide()
	
	# Rotation
	var player_look_dir: Vector2 = (get_global_mouse_position() - position).normalized()
	look_at(get_global_mouse_position())
	
	# Shooting
	if (is_primary_action_pressed and can_laser):
		var laser_markers := $LaserStartPositions.get_children()
		var selected_laser_mark := laser_markers[randi() % laser_markers.size()]
		
		can_laser = false
		$TimerLaser.start()
		
		laser_signal.emit(selected_laser_mark.global_position, player_look_dir)
		
	if (is_secondary_action_pressed and can_granade):
		var granade_marker := $LaserStartPositions/Marker2D2
		
		can_granade = false
		$TimerGranade.start()
		
		granade_signal.emit(granade_marker.global_position, player_look_dir)


func _on_timer_laser_timeout():
	can_laser = true


func _on_timer_granade_timeout():
	can_granade = true
