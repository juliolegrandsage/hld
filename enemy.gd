extends CharacterBody3D

var target_pos: Vector3
@export var ray_cast_3d: RayCast3D

func _ready() -> void:
	target_pos = $"../Drone".global_position

func _physics_process(delta: float) -> void:
	pass
