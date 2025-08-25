extends Node3D

var card_scene = preload("res://scenes/game/objects/card.tscn")

var current_x_offset = 0.0;
var x_step = 3.5

var amount_off_card = 0
var ace_value = false

func _ready():
	add_card(0)
func _input(event):
	if event.is_action_pressed("ui_accept"):
		add_card(0);
		

func add_card(id):
	
	var new_card = card_scene.instantiate()
	
	new_card.transform.origin.x = current_x_offset
	current_x_offset += x_step
	
	$cards.add_child(new_card)
	
	new_card.set_card(id)
	$cards.transform.origin.x = -(current_x_offset-x_step)/2
	
	calculate_value();
	
func calculate_value():
	var total_value = 0
	for card in $cards.get_children():
		var card_value = card.id;
		while card.id > 13:
			card_value -= 13;
		
		if card_value > 10:
			total_value += 10
		else: 
			total_value += card_value+1
			
		if card_value == 0:
			ace_value = true
			

		if ace_value && total_value+10 > 21:
			ace_value = false
		
	if !ace_value:
		print(total_value)
	else:
		print(str(total_value + "/" + str(total_value+10)))
