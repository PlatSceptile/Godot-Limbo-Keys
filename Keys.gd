extends Node2D

# THIS IS THE MAIN CODE THAT RUNS THAT RANDOMIZES AND RUNS THE PROGRAM ON THE BEAT

var correctkey = null
var keyrngseed = RandomNumberGenerator.new()
var shuffleseed = RandomNumberGenerator.new()
var greenflash = false
var returncolor = null
var start = false
var key1 = null
var key2 = null
var key3 = null
var key4 = null
var key5 = null
var key6 = null
var key7 = null
var key8 = null
var nextpattern = 0
var selection = false
var finished = false
var wrong = false

func _ready():
	$AudioStreamPlayer.playing = true
	key1 = $Sprite
	key2 = $Sprite2
	key3 = $Sprite3
	key4 = $Sprite4
	key5 = $Sprite5
	key6 = $Sprite6
	key7 = $Sprite7
	key8 = $Sprite8
	returncolor = $Sprite.modulate
	
	# Randomizing Key
	keyrngseed.randomize()
	correctkey = keyrngseed.randi_range(1,8)
	correctkey = round(correctkey)
	match correctkey:
		1.0:
			correctkey = key1
		2.0:
			correctkey = key2
		3.0:
			correctkey = key3
		4.0:
			correctkey = key4
		5.0:
			correctkey = key5
		6.0:
			correctkey = key6
		7.0:
			correctkey = key7
		8.0:
			correctkey = key8
	
	# Music
	var audiofade = create_tween()
	audiofade.set_trans(Tween.TRANS_LINEAR)
	audiofade.tween_property($AudioStreamPlayer, "volume_db",0,2)
	$AudioStreamPlayer.seek(177)

func _process(_delta):
	
	# Green Flash
	if $AudioStreamPlayer.get_playback_position() >= 180 and greenflash == false:
		print("its time")
		greenflash = true
		var correctkeyflash = create_tween()
		correctkeyflash.tween_property(correctkey, "modulate", Color.darkolivegreen, 0.3)
		correctkeyflash.tween_property(correctkey, "modulate", returncolor, 0.3)
	
	# STARTING
	if $AudioStreamPlayer.get_playback_position() >= 181.2 and start == false:
		start = true
		$Timer.start()
		_on_Timer_timeout()
	
	# Selecting Key
	if selection == true and wrong != true:
		if (get_global_mouse_position().x <= correctkey.position.x + 35) and (get_global_mouse_position().y <= correctkey.position.y + 25) and (get_global_mouse_position().x >= correctkey.position.x - 35) and (get_global_mouse_position().y >= correctkey.position.y - 25):
			if Input.is_action_just_pressed("ui_end"):
				print("GG")
				$Label.text = "GG YOU BEAT LIMBO"
			else:
				pass
		elif Input.is_action_just_pressed("ui_end"):
			print("YOUFAILED")
			$Label.text = "YOU FAILED.... RESTARTING"
			wrong = true
			$Timer2.start()
		elif finished == true:
			print("PICK THE KEY COWARD")
			$Label.text = "PICK THE KEY COWARD"
			wrong = true
			$Timer2.start()

# Random Shuffling
func _on_Timer_timeout():
	if $AudioStreamPlayer.get_playback_position() <= 189:
		shuffleseed.randomize()
		nextpattern = shuffleseed.randi_range(0,6)
		match nextpattern:
			0:
				key1.full_cycle_clockwise()
				key2.full_cycle_clockwise()
				key3.full_cycle_clockwise()
				key4.full_cycle_clockwise()
				key5.full_cycle_clockwise()
				key6.full_cycle_clockwise()
				key7.full_cycle_clockwise()
				key8.full_cycle_clockwise()
			1:
				key1.diag_swap()
				key2.diag_swap()
				key3.diag_swap()
				key4.diag_swap()
				key5.diag_swap()
				key6.diag_swap()
				key7.diag_swap()
				key8.diag_swap()
			2:
				key1.full_cycle_anticlockwise()
				key2.full_cycle_anticlockwise()
				key3.full_cycle_anticlockwise()
				key4.full_cycle_anticlockwise()
				key5.full_cycle_anticlockwise()
				key6.full_cycle_anticlockwise()
				key7.full_cycle_anticlockwise()
				key8.full_cycle_anticlockwise()
			3:
				key1.half_cycle_clockwise()
				key2.half_cycle_clockwise()
				key3.half_cycle_clockwise()
				key4.half_cycle_clockwise()
				key5.half_cycle_clockwise()
				key6.half_cycle_clockwise()
				key7.half_cycle_clockwise()
				key8.half_cycle_clockwise()
			4:
				key1.half_cycle_anticlockwise()
				key2.half_cycle_anticlockwise()
				key3.half_cycle_anticlockwise()
				key4.half_cycle_anticlockwise()
				key5.half_cycle_anticlockwise()
				key6.half_cycle_anticlockwise()
				key7.half_cycle_anticlockwise()
				key8.half_cycle_anticlockwise()
			5:
				key1.top_to_bottom()
				key2.top_to_bottom()
				key3.top_to_bottom()
				key4.top_to_bottom()
				key5.top_to_bottom()
				key6.top_to_bottom()
				key7.top_to_bottom()
				key8.top_to_bottom()
			6:
				key1.triangle_swap()
				key2.triangle_swap()
				key3.triangle_swap()
				key4.triangle_swap()
				key5.triangle_swap()
				key6.triangle_swap()
				key7.triangle_swap()
				key8.triangle_swap()
	else:
		key1.end()
		key2.end()
		key3.end()
		key4.end()
		key5.end()
		key6.end()
		key7.end()
		key8.end()
		$Timer.paused = true
		selection = true

func _on_AudioStreamPlayer_finished():
	finished = true
	$AudioStreamPlayer.playing = false
	
func _on_Timer2_timeout():
	get_tree().reload_current_scene()
