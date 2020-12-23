extends Dialogue

onready var player_ch = Rakugo.define_character("Player-kun", "player", Color.aqua)

func _ready():
	Rakugo.define_character("Cool Developer", "cool", Color.violet)
	Rakugo.define_character("Yui", "yui", Color.pink)

func first_dialogue():
	start_event("first_dialogue")
	
	say("yui", "Hi, I'm Yui and your are too close.")
	show("yui happy", {"scale":1})
	step()
#
#	say (null , "Choose one option.")
#	var choice = menu([
#		["First choice", 1, {}],
#		["Second choice", 2, {}],
#	])
#
#	if is_active():
#		if cond(choice == 1):
#			say(null, "You choose First choice")
#
#		elif cond(choice == 2):
#			say(null, "You choose Second choice")
	
	say(null, "What is your name? (default: {i}<player.name>{/i}.)", {"typing":false})
	
	var player_name = ask("", {"placeholder": "Player Name"})
	
	if is_active():
		if cond(player_name != null):
			player_ch.name = player_name

	step()

	say(null, "Your name is <player.name>.")
	step()

	say("cool", "This is our first dialogue! {:sunglasses:}")
	step()
	
	say(null, "Test save Your name is <player.name>.")
	step()

	say("cool", "My name is <cool.name> {:sunglasses:}")
	step()

	end_event()
