extends Node2D



# Assuming the RayCast2D and Sprite nodes are children of this Node2D
@onready var raycast = $PlayerTopDown/Direction
@onready var sprite = $PlayerTopDown/Direction/TEST

func _process(_delta):
	if raycast.is_colliding():
		var collision_point = raycast.get_collision_point()
		sprite.position = raycast.to_local(collision_point)
	else:
	print(raycast.cast_to)  # Debugging line
		sprite.position = raycast.cast_to
