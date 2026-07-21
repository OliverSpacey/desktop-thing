extends Control
class_name Desktop

@export var desktop_ui : DesktopUI
@export var test_app : App
@export var apps_on_start : Array[App] = []

@onready var task_bar : TaskBar = desktop_ui.task_bar

var apps : Array[App]
var open_apps : Array[App]
var minimised_apps : Array[App]
var log_window : Log
var cmd_window : CMD


func _ready() -> void:
	#Finds any children in the scene that are apps (makes it easier to drop in test apps for now)
	var TEMP_apps_to_add = TEMP_find_apps_as_children()
	
	#Adds any apps that need to load on start to array
	add_apps_on_start(TEMP_apps_to_add)
	
	#Load apps on start
	for app in apps_on_start:
		task_bar.add_app_to_task_bar(app)
	apps.append_array(apps_on_start)

func add_apps_on_start(apps_to_add : Array[App]):
	apps_on_start.append_array(apps_to_add)

func TEMP_find_apps_as_children() -> Array[App]:
	var found_apps : Array[App] = []
	var children = get_children()
	
	for child in children:
		if child is App:
			found_apps.append(child)
			if child is Log:
				log_window = child
			elif child is CMD:
				cmd_window = child
			child.desktop = self
	return found_apps
