extends AnimatableBody3D


## The local destination coordinates for the obstacle
@export var move_to: Vector3
## The amount of time to get to the destination
@export var move_time: float = 1.0

func _ready() -> void:
	# create tween to make the obstacle move
	var tween: Tween = create_tween()
	
	# loops the following instructions
	tween.set_loops()
	# makes the movement of the obstacle more fluid
	tween.set_trans(Tween.TRANS_SINE)
	# go up
	tween.tween_property(self, "global_position", global_position + move_to, move_time)
	# go back down
	tween.tween_property(self, "global_position", global_position, move_time)
	
	
