extends Node

export (bool) var enabled = false
var host = "127.0.0.1"
var port = 25565
var client = null
var count = 0

func _ready():
	$"Sound Library/Piffle Poffle".play()
	
	if enabled:
		client = StreamPeerTCP.new()

		if !client.is_connected_to_host():
			print("Connecting...")
			client.connect_to_host(host, port)
			set_process(true)
			print("Connected")

func _process(delta):
	if not $"Sound Library/Piffle Poffle".playing:
		$"Sound Library/Piffle Poffle".play()
	
	if enabled:
		if client.get_status() == 1:
			count = count + delta
			
		if count > 1:
			print("Cannot connect to server!")
			client.disconnect_from_host()
			set_process(false)

func _on_Timer_timeout():
	if enabled:
		if client.is_connected_to_host():
			print("Received: " + str(client.get_string(24)))
