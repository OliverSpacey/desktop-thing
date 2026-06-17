extends Window
class_name cmd

@export var app_icon_texture : Texture2D
@export var app_default_width : int = 500
@export var app_default_height : int = 500
@export var cmd_entry_field : TextEdit

var app_name = "cmd"
var app_icon : AppIcon

func _ready():
	close_requested.connect(close_window)

func close_window():
	app_icon.parent_app = null
	queue_free()

func minimise_window():
	visible = false

func maximise_window():
	visible = true

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("enter"):
		print(cmd_entry_field.text)
