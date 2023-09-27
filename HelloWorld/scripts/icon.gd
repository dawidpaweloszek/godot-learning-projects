extends Sprite2D

var pos: Vector2 = Vector2.ZERO
var test_scale: int = 1
const scale_factor: int = 1
const speed: int = 10

# Called when the node enters the scene tree for the first time.
func _ready():
	position = pos
	test_scale = 2
	scale = Vector2(test_scale, test_scale)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	test_scale += scale_factor
	print(test_scale)
	scale = Vector2(test_scale, test_scale)
