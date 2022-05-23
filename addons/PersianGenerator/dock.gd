tool
extends Control

onready var input = $VBoxContainer/HBoxContainer2/Input
onready var output = $VBoxContainer/HBoxContainer3/Output
onready var settings = $Settings


func _on_Generate_pressed():
	output.text = Persian.toPersian(input.text)
	if settings.base_data.FixNums:
		output.text = Persian.to_persian_number(output.text)
	if settings.base_data.CopyOnGen:
		copy(output.text)

func _on_Copy_pressed():
	copy(output.text)

func _on_Settings_pressed():
	settings.popup_centered()


func copy(text:String):
	OS.clipboard = text


func _on_Clean_pressed():
	input.text = ""
	output.text = ""
