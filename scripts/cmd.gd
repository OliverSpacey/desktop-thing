extends App
class_name cmd

@export var cmd_entry_field : LineEdit
@export var text_history_label : Label

func _ready():
	app_name = "cmd"


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("enter") and has_focus():
		text_history_label.text = text_history_label.text + "\n" + ">" + cmd_entry_field.text
		cmd_entry_field.clear()
