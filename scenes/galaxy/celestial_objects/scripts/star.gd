extends KinematicBody2D

var c = Physics.universe_center
var r = 0
var af = 0
var at = 0
var co = 0
func _process(delta):
	update()
	
func _draw():
	draw_circle_arc(c, r, af, at, co)

func draw_circle_arc(center, radius, angle_from, angle_to, color):
	var nb_points = 64
	var points_arc = PoolVector2Array()

	for i in range(nb_points + 1):
		var angle_point = deg2rad(angle_from + i * (angle_to-angle_from) / nb_points - 90)
		points_arc.push_back(center + Vector2(cos(angle_point), sin(angle_point)) * radius)

	for index_point in range(nb_points):
		draw_line(points_arc[index_point], points_arc[index_point + 1], color)


func _on_planet_mouse_over_planet(radius, angle_from, angle_to, color):
	r = radius
	af = angle_from
	at = angle_to
	co = color
