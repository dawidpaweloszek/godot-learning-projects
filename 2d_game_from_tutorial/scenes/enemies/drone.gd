extends CharacterBody2D

var speed := 200


func _process(_delta):
	# Direction
	var direction := Vector2.RIGHT
	
	# Movement
	velocity = direction * speed
	move_and_slide()
