extends KinematicBody2D

var starting_pos
var speed = 400
var jump_speed = -275
var gravity = 200
var velocity = Vector2()
onready var player = get_node("Sprite")

func get_input(delta):
	print(starting_pos, position)
	velocity.x = 0
	
	if Input.is_action_just_pressed("sprint") and (is_on_floor()):
		speed = 600
	if Input.is_action_just_released("sprint"):
		speed = 400
	if Input.is_action_pressed("move_right"):
		velocity.x += speed
	if Input.is_action_pressed("move_left"):
		velocity.x -= speed
	if Input.is_action_pressed("jump"):
		if (is_on_floor()):
			velocity.y += jump_speed
	if (not is_on_floor()):
		velocity.y -= (jump_speed * 1.25) * delta
		
	if velocity.y > 1000:
		velocity.y = 0
		velocity.x = 0
	
	velocity.y += gravity * delta
	velocity = move_and_slide(velocity, Vector2.UP)
	
	var pos = player.global_position
	if pos.y > 1000:
		position = starting_pos
		print("fuck")
	
func _physics_process(delta):
	get_input(delta)

func _ready():
	starting_pos = position
