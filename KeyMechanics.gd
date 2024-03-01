extends Sprite

# THIS IS THE CODE THAT ACTUALLY MOVES EACH KEY SEPERATELY. IT IS EXECUTED FOR EACH KEY SEPERATELY.

var A1 = null
var B1 = null
var A2 = null
var B2 = null
var A3 = null
var B3 = null
var A4 = null
var B4 = null
var Move = null

# Defining Positions
func _ready():
	A1 = $"../A1".position
	B1 = $"../B1".position
	A2 = $"../A2".position
	B2 = $"../B2".position
	A3 = $"../A3".position
	B3 = $"../B3".position
	A4 = $"../A4".position
	B4 = $"../B4".position

# Shuffle Patterns
func diag_swap():
	Move = create_tween()
	Move.set_ease(Tween.EASE_IN_OUT).set_trans(Tween.TRANS_LINEAR)
	match position:
		A1:
			Move.tween_property(self, "position", B2, 0.25)
		B1:
			Move.tween_property(self, "position", A2, 0.27)
		A2:
			Move.tween_property(self, "position", B1, 0.27)
		B2:
			Move.tween_property(self, "position", A1, 0.27)
		A3:
			Move.tween_property(self, "position", B4, 0.27)
		B3:
			Move.tween_property(self, "position", A4, 0.27)
		A4:
			Move.tween_property(self, "position", B3, 0.27)
		B4:
			Move.tween_property(self, "position", A3, 0.27)

func full_cycle_clockwise():
	Move = create_tween()
	Move.set_ease(Tween.EASE_IN_OUT).set_trans(Tween.TRANS_QUAD)
	match position:
		A1:
			Move.tween_property(self, "position", B1, 0.27)
		B1:
			Move.tween_property(self, "position", B2, 0.27)
		A2:
			Move.tween_property(self, "position", A1, 0.27)
		B2:
			Move.tween_property(self, "position", B3, 0.27)
		A3:
			Move.tween_property(self, "position", A2, 0.27)
		B3:
			Move.tween_property(self, "position", B4, 0.27)
		A4:
			Move.tween_property(self, "position", A3, 0.27)
		B4:
			Move.tween_property(self, "position", A4, 0.27)

func full_cycle_anticlockwise():
	Move = create_tween()
	Move.set_ease(Tween.EASE_IN_OUT).set_trans(Tween.TRANS_QUAD)
	match position:
		B1:
			Move.tween_property(self, "position", A1, 0.27)
		A1:
			Move.tween_property(self, "position", A2, 0.27)
		B2:
			Move.tween_property(self, "position", B1, 0.27)
		A2:
			Move.tween_property(self, "position", A3, 0.27)
		B3:
			Move.tween_property(self, "position", B2, 0.27)
		A3:
			Move.tween_property(self, "position", A4, 0.27)
		B4:
			Move.tween_property(self, "position", B3, 0.27)
		A4:
			Move.tween_property(self, "position", B4, 0.27)

func half_cycle_clockwise():
	Move = create_tween()
	Move.set_ease(Tween.EASE_IN_OUT).set_trans(Tween.TRANS_QUAD)
	match position:
		A1:
			Move.tween_property(self, "position", B1, 0.27)
		B1:
			Move.tween_property(self, "position", B2, 0.27)
		A2:
			Move.tween_property(self, "position", A1, 0.27)
		B2:
			Move.tween_property(self, "position", A2, 0.27)
		A3:
			Move.tween_property(self, "position", A4, 0.27)
		B3:
			Move.tween_property(self, "position", A3, 0.27)
		A4:
			Move.tween_property(self, "position", B4, 0.27)
		B4:
			Move.tween_property(self, "position", B3, 0.27)

func half_cycle_anticlockwise():
	Move = create_tween()
	Move.set_ease(Tween.EASE_IN_OUT).set_trans(Tween.TRANS_QUAD)
	match position:
		B1:
			Move.tween_property(self, "position", A1, 0.27)
		A1:
			Move.tween_property(self, "position", A2, 0.27)
		B2:
			Move.tween_property(self, "position", B1, 0.27)
		A2:
			Move.tween_property(self, "position", B2, 0.27)
		B3:
			Move.tween_property(self, "position", B4, 0.27)
		A3:
			Move.tween_property(self, "position", B3, 0.27)
		B4:
			Move.tween_property(self, "position", A4, 0.27)
		A4:
			Move.tween_property(self, "position", A3, 0.27)

func top_to_bottom():
	Move = create_tween()
	Move.set_ease(Tween.EASE_IN_OUT).set_trans(Tween.TRANS_QUAD)
	match position:
		A1:
			Move.tween_property(self, "position", B4, 0.27).set_trans(Tween.TRANS_LINEAR)
		B1:
			Move.tween_property(self, "position", A4, 0.27).set_trans(Tween.TRANS_LINEAR)
		A2:
			Move.tween_property(self, "position", A1, 0.27).set_trans(Tween.TRANS_QUAD)
		B2:
			Move.tween_property(self, "position", B1, 0.27).set_trans(Tween.TRANS_QUAD)
		A3:
			Move.tween_property(self, "position", A2, 0.27).set_trans(Tween.TRANS_QUAD)
		B3:
			Move.tween_property(self, "position", B2, 0.27).set_trans(Tween.TRANS_QUAD)
		A4:
			Move.tween_property(self, "position", A3, 0.27).set_trans(Tween.TRANS_QUAD)
		B4:
			Move.tween_property(self, "position", B3, 0.27)

func triangle_swap():
	Move = create_tween()
	Move.set_ease(Tween.EASE_IN_OUT).set_trans(Tween.TRANS_QUAD)
	match position:
		A1:
			Move.tween_property(self, "position", B1, 0.27)
		B1:
			Move.tween_property(self, "position", A2, 0.27)
		A2:
			Move.tween_property(self, "position", A1, 0.27)
		B2:
			Move.tween_property(self, "position", A3, 0.27)
		A3:
			Move.tween_property(self, "position", B2, 0.27)
		B3:
			Move.tween_property(self, "position", B4, 0.27)
		A4:
			Move.tween_property(self, "position", B3, 0.27)
		B4:
			Move.tween_property(self, "position", A4, 0.27)

# Shuffle End Color Change
func end():
	var endcolor = create_tween().set_ease(Tween.EASE_IN_OUT).set_trans(Tween.TRANS_QUAD)
	match position:
		A1:
			endcolor.tween_property(self, "modulate", Color.purple, 1.5)
		A2:
			endcolor.tween_property(self, "modulate", Color.greenyellow, 1.5)
		A3:
			endcolor.tween_property(self, "modulate", Color.pink, 1.5)
		A4:
			endcolor.tween_property(self, "modulate", Color.darkgreen, 1.5)
		B1:
			endcolor.tween_property(self, "modulate", Color.cyan, 1.5)
		B2:
			endcolor.tween_property(self, "modulate", Color.red, 1.5)
		B3:
			endcolor.tween_property(self, "modulate", Color.blue, 1.5)
		B4:
			endcolor.tween_property(self, "modulate", Color.yellow, 1.5)

