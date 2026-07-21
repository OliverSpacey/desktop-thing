extends Panel
class_name TaskBar

@export var container : HBoxContainer
@export var app_icon_size : Vector2 =  Vector2(60,60)
@export var app_icon_template : PackedScene = preload("res://test scenes/app_icon.tscn")

var task_bar_apps : Array[App]


func add_app_to_task_bar(app: App) -> void:
	print("Adding app")
	task_bar_apps.append(app)
	add_app_icon_to_task_bar(app)

func remove_app_from_task_bar(app: App) -> void:
	print("Removing app")
	task_bar_apps.remove_at(task_bar_apps.find(app))
	remove_app_icon_from_task_bar(app)

func add_app_icon_to_task_bar(app: App) -> void:
	print("Adding icon to task bar" + app.name)
	var app_icon = app_icon_template.instantiate()
	container.add_child(app_icon)
	var icon_texture : TextureRect = app_icon.icon_texture_rect
	icon_texture.texture = app.app_icon_texture
	app_icon.assign_parent_app(app)
	resize_icons()

func remove_app_icon_from_task_bar(app: App) -> void:
	print("Removing icon from task bar")
	container.remove_child(app.app_icon)
	resize_icons()


func _on_item_rect_changed() -> void:
	resize_icons()

func resize_icons() -> void:
	var icons = container.get_children()
	for icon in icons:
		icon.custom_minimum_size = Vector2(get_rect().size[1], get_rect().size[1])
