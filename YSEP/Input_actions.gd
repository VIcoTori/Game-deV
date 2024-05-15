extends CharacterBody2D

# Valeur physique
@export var speed :int = 175
const acceleration = 7
@export var Bullet = preload("res://bullet.tscn")

func _ready(): # one time at start
	pass
	
	
# movement wasd // every frame
func _physics_process(_delta):
	velocity = Vector2()
	if Input.is_action_pressed("down"):
		velocity.y += speed
	if Input.is_action_pressed("up"):
		velocity.y -= speed
	if Input.is_action_pressed("right"):
		velocity.x += speed
	if Input.is_action_pressed("left"):
		velocity.x -= speed
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
