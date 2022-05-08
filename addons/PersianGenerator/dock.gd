tool
extends Control

onready var input = $VBoxContainer/Input
onready var output = $VBoxContainer/Output
onready var generate = $VBoxContainer/Generate

var persian = preload("res://addons/PersianGenerator/Persian.gd").new()

func _on_Generate_pressed():
	output.text = persian.toPersian(input.text)
	print("aa")
