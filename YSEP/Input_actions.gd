extends CharacterBody2D

# Valeur physique
@export var speed :int = 100
const acceleration = 7
@export var Bullet = preload("res://bullet.tscn")

func _ready(): # one time at start
	pass
	
	
# movement wasd // every frame

func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * speed

func _physics_process(_delta):
	get_input()
	move_and_slide()
	if Input.is_action_pressed("shoot"):
		shoot()
	# permet de d'avoir la même vitesse en diagonal
	velocity = velocity.normalized()
	
	set_velocity(velocity*speed)
	move_and_slide()

func shoot():
	var b = Bullet.instantiate()
	add_child(b)
	b.transform = $Muzzle.global_transform
