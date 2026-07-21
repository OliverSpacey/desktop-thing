extends App
class_name Log

@export var text_history_label : Label

func _ready() -> void:
	app_name = "Log"
	title = app_name

func add_text_to_log(text: String) -> void:
	text_history_label.text = text_history_label.text + "\n" + ">" + text
