extends App
class_name CMD

@export var cmd_entry_field : LineEdit
@export var cmd_log : Label

func _ready():
	app_name = "CMD Terminal"
	title = app_name

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("enter") and get_focused_window() == self:
		desktop.log_window.add_text_to_log(cmd_entry_field.text)
		cmd_entry_field.clear()
