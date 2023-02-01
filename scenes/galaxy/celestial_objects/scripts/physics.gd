extends Node2D

var rng = RandomNumberGenerator.new()

var universe_center = Vector2(0,0)
var speed_scale = 365/60/60
class celestial_body:
	var radius
	var distance
	var angle
		
