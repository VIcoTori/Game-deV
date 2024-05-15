extends Area2D

@export var speed :int = 10 #speed of the bullet
var Scene_Principal = preload("res://node_2d.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	set_process(true) # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var direction = $PlayerTopDown/Direction.target_position #direction of bullet
	position += direction * speed * delta
	if is_out_of_screen():
		queue_free()
		
func is_out_of_screen():
	var viewport_rect = get_viewport_rect()
	return !viewport_rect.has_point(position)
