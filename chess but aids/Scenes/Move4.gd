extends Sprite

var squaresshow
var currentpositionred
var mouseposition
var move = false

func _ready():
		currentpositionred = get_parent().currentposition
		currentpositionred.x = stepify(currentpositionred.x, 64)-64
		currentpositionred.y = stepify(currentpositionred.y, 64)

func _process(delta):
	squaresshow = get_parent().squaresshow
	mouseposition = get_parent().mouseposition
	if squaresshow == true:
		show()
		set_position(currentpositionred)
		print(" currentpositionred.x+32 = ", currentpositionred.x+32," currentpositionred.y+32 = ", currentpositionred.y+32," mouseposition = ", mouseposition)
		if (mouseposition.x == currentpositionred.x+32) and (mouseposition.y == currentpositionred.y+32):
			move = true
	else:
		hide()