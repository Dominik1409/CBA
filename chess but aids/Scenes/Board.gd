extends Sprite

var Size = 64

var OffsetX = -16
var OffsetY = -16

var Test_Piece = preload("res://Scenes/Piece_test.tscn")

var Squares = []

func _ready():

	
	var Black = preload("res://Scenes/BlackTile.tscn")
	var White = preload("res://Scenes/WhiteTile.tscn")
	
	var Sprites = [White,Black]
	
	var Current
	
	for x in range(8):
		for y in range(8):
			if (x % 2 == 0 and y % 2 == 0) or (x % 2 != 0 and y % 2 != 0):
				Current = Sprites[0].instance()
			else:
				Current = Sprites[1].instance()
			Current.position = Vector2(Size + OffsetX + x*Size,Size + OffsetY + y*Size)
			self.add_child(Current)
			Squares.append(Current)
		
	var TP = Test_Piece.instance()
	add_child(TP)	

func CreateBoardSprites():
	var Sprites = []
			
	var BlackImage = Image.new()
	var WhiteImage = Image.new()
	
	BlackImage.create(Size,Size,false,Image.FORMAT_RGBA8) 
	WhiteImage.create(Size,Size,false,Image.FORMAT_RGBA8) 
	
	BlackImage.lock()
	BlackImage.fill(Color.darkgray)
	BlackImage.unlock()
	
	WhiteImage.lock()
	WhiteImage.fill(Color.white)
	WhiteImage.unlock()
	
	var BlackTexture = ImageTexture.new()
	var WhiteTexture = ImageTexture.new()
	
	BlackTexture.create_from_image(BlackImage,0)
	WhiteTexture.create_from_image(WhiteImage,0)
	
	var BlackSprite = Sprite.new()
	BlackSprite.texture = BlackTexture
	
	var WhiteSprite = Sprite.new()
	WhiteSprite.texture = WhiteTexture
	Sprites.append(WhiteSprite)
	Sprites.append(BlackSprite)
	pass
	
		
		