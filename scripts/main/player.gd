extends CharacterBody2D

const  BASE_SPEED = 50.0
var move_speed = 50.0

const JUMP_VELOCITY = -200.0

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var level_scene = get_tree().get_first_node_in_group("level")


func die():
	print("DIED")
	
	get_tree().reload_current_scene()
	


func _physics_process(delta: float) -> void:
	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		animated_sprite.play("Jump")
		
	_move(delta)




func _move(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
		
	if Input.is_action_pressed("sprint"):
		move_speed = BASE_SPEED * 2
	else:
		move_speed = BASE_SPEED
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	
	# Flip sprite based on direction of movement
	if direction > 0:
		animated_sprite.flip_h = false
	elif direction < 0:
		animated_sprite.flip_h = true
	
	#Play animations
	if is_on_floor():
		if direction == 0:
			animated_sprite.play("Idle")
		else:
			animated_sprite.play("Walking")
	else:
		if velocity.y > 0:
			animated_sprite.play("Falling")
		elif velocity.y < 0:
			animated_sprite.play("Rising")
	
	if direction:
		velocity.x = direction * move_speed
	else:
		velocity.x = move_toward(velocity.x, 0, move_speed)

	move_and_slide()
