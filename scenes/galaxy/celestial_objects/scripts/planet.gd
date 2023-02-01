extends KinematicBody2D

signal mouse_over_planet(radius, angle_from, angle_to, color)
onready var rotation_point = Physics.universe_center
onready var distance_from_point = global_position.distance_to(rotation_point)
onready var theta = global_position.angle_to_point(rotation_point)
onready var speed = Physics.rng.randf_range(1,5)/(distance_from_point/100)

var mouseOver = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	global_position = rotation_point
	global_position += Vector2(cos(theta), sin(theta)) * distance_from_point
	theta += (delta*Physics.speed_scale*speed)

func _on_planet_mouse_entered():
	emit_signal("mouse_over_planet", distance_from_point-75, 0, 360, Color(255,255,255))
	print("Mouse in")

func _on_planet_mouse_exited():
	emit_signal("mouse_over_planet", 0, 0, 0, Color(255,255,255))
	print("Mouse out")
		
