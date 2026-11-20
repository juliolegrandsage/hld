extends CharacterBody3D

var target_pos: Vector3
var player = preload("res://drone.tscn")

func _ready() -> void:
	player = get_tree().get_first_node_in_group("player")
	target_pos = player.position

func _physics_process(delta: float) -> void:
	velocity = target_pos * 200 * delta
	
	move_and_slide()


func _on_timer_timeout() -> void:
	queue_free() # Replace with function body.
