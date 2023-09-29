extends CharacterBody2D

var speed := 300

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
	if (is_primary_action_pressed):
		print("Shoot laser!")
		
	if (is_secondary_action_pressed):
		print("Shoot granade!")
