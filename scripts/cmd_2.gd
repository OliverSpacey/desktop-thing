extends App
class_name CMD_2

"""
This file is the version of the CMD with the log embedded. Now need to get the log to autoscroll to show the bottom-most text entry
"""

@export var cmd_entry_field : LineEdit
@export var cmd_log : Label
@export var scroll_container : ScrollContainer
@export var auto_scroll : bool = true

func _ready() -> void:
	app_name = "CMD Terminal 2"
	title = app_name

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("enter") and cmd_entry_field.has_focus():
		add_text_to_log(cmd_entry_field.text)
		cmd_entry_field.clear()

func add_text_to_log(text: String) -> void:
	cmd_log.text = cmd_log.text + "\n" + ">" + text
	if auto_scroll:
		scroll_to_bottom.call_deferred()

func scroll_to_bottom() -> void:
	var stb := func():
		scroll_container.scroll_vertical = scroll_container.get_v_scroll_bar().max_value
	stb.call_deferred()



func _on_focus_exited() -> void:
	cmd_entry_field.focus_exited.emit()
