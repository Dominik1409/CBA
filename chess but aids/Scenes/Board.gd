extends Sprite

var Size = 32

var OffsetX = + Size * 0.5
var OffsetY = + Size * 0.5

var Test_Piece = preload("res://Scenes/Piece_test.tscn")

var Squares = []

func _ready():

	
	var Black = preload("res://Scenes/BlackTile.tscn")
	var White = preload("res://Scenes/WhiteTile.tscn")
	
	var Sprites = [White,Black]
	
	var Current
	
	var ScalingFactor = Size / 32
	
	for x in range(8):
		for y in range(8):
			if (x % 2 == 0 and y % 2 == 0) or (x % 2 != 0 and y % 2 != 0):
				Current = Sprites[0].instance()
			else:
				Current = Sprites[1].instance()
			Current.position = Vector2(Size + OffsetX + x*Size,Size + OffsetY + y*Size)
			Current.set_scale(Vector2(ScalingFactor,ScalingFactor))
			self.add_child(Current)
			Squares.append(Current)
		
	var TP = Test_Piece.instance()
	add_child(TP)	
