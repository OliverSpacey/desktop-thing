extends App
class_name cmd

@export var cmd_entry_field : TextEdit


func _ready():
	app_name = "cmd"
	focus_exited.emit()


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("enter") and has_focus():
		print("Check if cmd is focused")
		print(cmd_entry_field.text)
		print("Save text to new label and spawn it ABOVE the text entry field to push this down")
		print("Clear text field")
		cmd_entry_field.clear()
		cmd_entry_field.clear()
