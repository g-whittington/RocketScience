extends RigidBody3D

var flight_force := 1000.0
var rotation_force := 100.0

# called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("boost"):
		# basis here is a local value of the y axis that will change 
		# the shape's actally y, and not just apply a general up force
		apply_central_force(basis.y * delta * flight_force)

	# applying torque rotates an object 
	if Input.is_action_pressed("rotate_left"):
		apply_torque(Vector3(0, 0, rotation_force * delta))
		
	if Input.is_action_pressed("rotate_right"):
		apply_torque(Vector3(0, 0, -rotation_force * delta))

# using this as collision dection with the player
# have to opt in to rigid body collsion like this in: Solver -> Contact Monitor
func _on_body_entered(body: Node) -> void:
	# way to win the game
	if body.is_in_group("Goal"):
		print("You Win!")
		
	# die if touch floor
	if body.is_in_group("Hazard"):
		print("You Crashed!")
