extends Sprite

var mouseposition
var currentposition = get_position()
var hasmoved
var originalposition
var squaresshow = false
var move
var move2
var move3
var move4
var currentpositionred
var currentpositionred2
var currentpositionred3
var currentpositionred4

func displaysquares():
	squaresshow = true
func hidesquares():
	squaresshow = false

func _process(delta):
	move = get_node("Move").move
	move2 = get_node("Move2").move
	move3 = get_node("Move3").move
	move4 = get_node("Move4").move
	mouseposition = get_local_mouse_position()
	mouseposition.x = stepify(mouseposition.x,64)+32
	mouseposition.y = stepify(mouseposition.y,64)+32
	print(mouseposition)
	currentpositionred = get_node("Move").currentpositionred
	currentpositionred2 = get_node("Move2").currentpositionred
	currentpositionred3 = get_node("Move3").currentpositionred
	currentpositionred4 = get_node("Move4").currentpositionred
	if(Input.is_mouse_button_pressed(BUTTON_LEFT)):
		if mouseposition == currentposition:
			displaysquares()
		else:
			hidesquares()
	if move == true:
		global_translate(currentpositionred)
		hidesquares()
		move = false
		get_node("Move").move = false
		move2 = false
		get_node("Move2").move = false
		move3 = false
		get_node("Move3").move = false		
		move3 = false
		get_node("Move4").move = false		
	if move2 == true:
		global_translate(currentpositionred2)
		hidesquares()
		move = false
		get_node("Move").move = false
		move2 = false
		get_node("Move2").move = false
		move3 = false
		get_node("Move3").move = false		
		move3 = false
		get_node("Move4").move = false		
	if move3 == true:
		global_translate(currentpositionred3)
		hidesquares()
		move = false
		get_node("Move").move = false
		move2 = false
		get_node("Move2").move = false
		move3 = false
		get_node("Move3").move = false		
		move3 = false
		get_node("Move4").move = false		
	if move4 == true:
		global_translate(currentpositionred4)
		hidesquares()
		move = false
		get_node("Move").move = false
		move2 = false
		get_node("Move2").move = false
		move3 = false
		get_node("Move3").move = false		
		move3 = false
		get_node("Move4").move = false		
		
		
#		 