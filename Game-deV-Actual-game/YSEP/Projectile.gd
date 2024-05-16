extends Node2D

@export var speed :int = 10 #speed of the bullet
var Scene_Principal = preload("res://node_2d.tscn")
var temp_sprite
var timer = Timer



func _ready(): # Called when the node enters the scene tree for the first time.
	set_process(true) # Replace with function body.
	var timer = get_node("Timer")
	
	
func _timer():
	timer.timeout.connect()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += transform.x * speed * delta
	if is_out_of_screen():
		queue_free()

func is_out_of_screen():
	var viewport_rect = get_viewport_rect()
	return !viewport_rect.has_point(position)

func _on_Timer_timeout():
	queue_free()  # Delete the object

