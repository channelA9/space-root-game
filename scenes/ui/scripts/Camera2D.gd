extends Camera2D

const MIN_ZOOM = 0.5
const MAX_ZOOM = 10
const ZOOM_INCREMENT: float = 0.25
const ZOOM_RATE: float = 5.0

var target_zoom = 1.0
var scroll_speed = 10

var onMap = true

func _ready():
	pass # Replace with function body.

func _process(_delta):
	var camera_velocity = Vector2.ZERO
	
	if Input.is_action_pressed("cam_move_right"):
		camera_velocity.x += 1
	if Input.is_action_pressed("cam_move_left"):
		camera_velocity.x -= 1
	if Input.is_action_pressed("cam_move_up"):
		camera_velocity.y -= 1
	if Input.is_action_pressed("cam_move_down"):
		camera_velocity.y += 1
	
	if camera_velocity.length() > 0:
		camera_velocity = camera_velocity.normalized() * (scroll_speed * target_zoom)
		position += camera_velocity
func zoom_in() -> void:
	target_zoom = max(target_zoom - ZOOM_INCREMENT, MIN_ZOOM)
	set_physics_process(true)
	
func zoom_out() -> void:
	target_zoom = min(target_zoom + ZOOM_INCREMENT, MAX_ZOOM)
	set_physics_process(true)
	
func _input(event: InputEvent):
	if onMap:
		if event.is_action_pressed("scroll_up"):
			zoom_in()
		if event.is_action_pressed("scroll_down"):
			zoom_out()

func _physics_process(delta: float):
	zoom = lerp(
		zoom,
		target_zoom * Vector2.ONE, 
		ZOOM_RATE * delta
		)
	
	set_physics_process(
		not is_equal_approx(zoom.x, target_zoom)
	)
