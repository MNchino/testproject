extends Area2D

func _ready():
	connect("body_entered", self, "on_player_entered")
	connect("body_exited", self, "on_player_exited")

func on_player_entered ( body ):
	if body.name == "Player":
		body.GRAVITY = 0
		body.motion.y = 0
			
func on_player_exited ( body ):
	if body.name == "Player":
		body.GRAVITY = 40


#TODO: ADD SWIMMING CONTROLS