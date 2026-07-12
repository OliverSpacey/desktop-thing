extends App
class_name CMD_2

"""
This file is the version of the CMD with the log embedded. Now need to get the log to autoscroll to show the bottom-most text entry
"""

@export var cmd_entry_field : LineEdit
@export var cmd_log : Label

func _ready():
	app_name = "CMD Terminal"
	title = app_name

func _input(event: InputEvent) -> void:
	print(get_focused_window())
	if event.is_action_pressed("enter") and get_focused_window() == self:
		print("Writing text to self log")
		add_text_to_log(cmd_entry_field.text)
		cmd_entry_field.clear()

func add_text_to_log(text: String):
	cmd_log.text = cmd_log.text + "\n" + ">" + text


func _on_focus_entered() -> void:
	print("Focused")



func _on_focus_exited() -> void:
	print("Exited")
