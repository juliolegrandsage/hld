extends CharacterBody3D


const SPEED = 5.0
const JUMP_VELOCITY = 4.5

@export var sensibility : float = 0.05
@export var camera: Camera3D 


func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _process(delta: float) -> void:
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		shoot()

	
func _physics_process(delta: float) -> void:
	
	var mouse_pos = get_viewport().get_mouse_position()
	
	var input_dir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	
	var dir = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	
	velocity = dir * SPEED
	
	if Input.is_mouse_button_pressed(MouseButton.MOUSE_BUTTON_LEFT):
		velocity.y = 2 * SPEED
	if Input.is_mouse_button_pressed(MouseButton.MOUSE_BUTTON_RIGHT):
		velocity.y = -2 * SPEED
		
	
	move_and_slide()
	
func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion and Input.mouse_mode == Input.MOUSE_MODE_CAPTURED:
		rotate_y(-event.relative.x * sensibility)
		camera.rotate_x(-event.relative.y * sensibility)
		
		camera.rotation.x = clamp(camera.rotation.x, deg_to_rad(-50), deg_to_rad(90))
		


func _on_area_3d_body_entered(body: Node3D) -> void:
	if body.is_in_group("enemy"):
		print("mor")
		body.queue_free()


func shoot():
	if $Camera3D/RayCast3D.is_colliding():
		if $Camera3D/RayCast3D.get_collider().is_in_group("enemy"):
			print("enemy")
