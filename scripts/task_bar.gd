extends Panel
class_name TaskBar

@export var container : HBoxContainer
@export var app_icon_size : Vector2 =  Vector2(60,60)
@export var app_icon_template : PackedScene = preload("res://test scenes/app_icon.tscn")

var task_bar_apps : Array[App]


func add_app_to_task_bar(app: App):
	print("Adding app")
	task_bar_apps.append(app)
	add_app_icon_to_task_bar(app)

func remove_app_from_task_bar(app: App):
	print("Removing app")
	task_bar_apps.remove_at(task_bar_apps.find(app))
	remove_app_icon_from_task_bar(app)

func add_app_icon_to_task_bar(app: App):
	print("Adding icon to task bar" + app.name)
	var app_icon = app_icon_template.instantiate()
	container.add_child(app_icon)
	var icon_texture : TextureRect = app_icon.icon_texture_rect
	icon_texture.texture = app.app_icon_texture
	app_icon.assign_parent_app(app)

func remove_app_icon_from_task_bar(app: App):
	print("Removing icon from task bar")
	container.remove_child(app.app_icon)
