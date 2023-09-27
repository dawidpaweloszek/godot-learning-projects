extends Node2D

var direction: int = 1

func _ready():
	$iconImage.position = Vector2(500, 300)
	
	
func _process(delta):
	if ($iconImage.rotation_degrees > 270 or $iconImage.rotation_degrees < 0):
		direction *= -1
	
	$iconImage.rotation_degrees += 45 * delta * direction
