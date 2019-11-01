extends Node2D

var Board = preload("res://Scenes/Board.tscn")

var IP

func Back():
	get_tree().change_scene("res://Scenes/Menu.tscn")

func _on_Client_pressed():
	IP = get_node("MenuObjects/IP").text
	get_node("MenuObjects").free()
	self.add_child( Board.instance() )
	get_tree().connect("network_peer_connected", self, "_player_connected")
	var Client = NetworkedMultiplayerENet.new()
	Client.create_client(IP,8080)
	#print(IP)
	get_tree().set_network_peer(Client)
	get_node("Node2D/Button").connect("pressed",self,"Back")

func _on_Server_pressed():
	get_node("MenuObjects").free()
	self.add_child( Board.instance() )
	get_tree().connect("network_peer_connected", self, "_player_connected")
	var Serv = NetworkedMultiplayerENet.new()
	Serv.create_server(8080,1)
	get_tree().set_network_peer(Serv)
	get_node("Node2D/Button").connect("pressed",self,"Back")

remote func MovePiece(Position):
	print(str(Position))

func _player_connected(id):
	print("Connection")