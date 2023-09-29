extends CharacterBody2D


var speed := 300
var can_laser := true
var can_granade := true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	# Input
	var direction := Input.get_vector("left", "right", "up", "down")
	var is_primary_action_pressed := Input.is_action_just_pressed("primary_action")
	var is_secondary_action_pressed := Input.is_action_just_pressed("secondary_action")
	
	# Position
	velocity = direction * speed
	move_and_slide()
	
	# Shooting
	if (is_primary_action_pressed and can_laser):
		print("Shoot laser!")
		can_laser = false
		$TimerLaser.start()
		
	if (is_secondary_action_pressed and can_granade):
		print("Shoot granade!")
		can_granade = false
		$TimerGranade.start()


func _on_timer_laser_timeout():
	can_laser = true


func _on_timer_granade_timeout():
	can_granade = true
