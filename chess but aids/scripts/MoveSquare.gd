extends Node2D

var Moveable = preload("res://Scenes/Moveable.tscn")
var currentposition
var originalposition
var piece
var setx	#number of tiles moved horizontally (positive is right, negative is left)
var sety	#number of tiles moved vertically (positive is up, negative is down)
var movearray
var held
var delete

#piece id's
var knight = "/root/Knight"

#locate position function
func resetpos():
	currentposition = originalposition
	set_position(originalposition)

func locate():
		setx *= 64
		sety *= -64
		currentposition.x += setx
		currentposition.y += sety
		movearray.append(currentposition)
		set_position(currentposition)
		currentposition = get_position()
		self.add_child(Moveable.instance())
		resetpos()
		
		


func _input(event):
	held = get_parent().held
	if held == true:
		currentposition = get_parent().currentposition
		originalposition = get_parent().currentposition
		set_position(currentposition)
		piece = get_parent().piece
		movearray = []
		resetpos()
#knight
	if piece == knight:
		resetpos()
		
		setx = 2
		sety = -1
		locate()
		
		setx = 1
		sety = -2
		locate()
		
		setx = -2
		sety = 1
		locate()
		
		setx = 2
		sety = 1
		locate()
		
		setx = -2
		sety = -1
		locate()
		
		setx = 1
		sety = 2
		locate()
		
		setx = -1
		sety = 2
		locate()
		
		setx = -1
		sety = -2
		locate()