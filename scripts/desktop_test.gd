extends Control
class_name Desktop

@export var desktop_ui : DesktopUI
@export var test_app : App

@onready var task_bar : TaskBar = desktop_ui.task_bar

func _ready():
	task_bar.add_app_to_task_bar(test_app)

var apps : Array[App]
var open_apps : Array[App]
var minimised_apps : Array[App]
