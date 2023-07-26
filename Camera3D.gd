extends Camera3D

var can_move: bool

# Called when the node enters the scene tree for the first time.
func _ready():
	can_move = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	# Movement
	if can_move:
		
		if Input.is_action_pressed("ui_up"):
			if not $RayCastFront.is_colliding():
				_transform_to(transform.translated_local(Vector3.FORWARD * 2))
		if Input.is_action_pressed("ui_down"):
			if not $RayCastBack.is_colliding():
				_transform_to(transform.translated_local(Vector3.FORWARD * -2))
		if Input.is_action_pressed("ui_left"):
			_transform_to(transform.rotated_local(Vector3.UP, PI/2))
		if Input.is_action_pressed("ui_right"):
			_transform_to(transform.rotated_local(Vector3.UP, -PI/2))
			
func _transform_to(new_transform: Transform3D):
	can_move = false
	var tween: Tween = create_tween()
	tween.finished.connect(func(): can_move = true)
	tween.tween_property(self, "transform", new_transform, 0.33)
