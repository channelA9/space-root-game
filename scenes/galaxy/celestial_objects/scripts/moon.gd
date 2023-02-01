extends KinematicBody2D

onready var rotation_point = get_parent().global_position
onready var distance_from_point = position.distance_to(rotation_point)
onready var theta = global_position.angle_to_point(rotation_point)
onready var speed = 1

var mouseOver = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	global_position = rotation_point
	global_position += Vector2(cos(theta), sin(theta)) * distance_from_point
	theta += (delta*Physics.speed_scale*speed)
