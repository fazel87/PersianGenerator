tool
extends EditorPlugin

var dock = preload("res://addons/PersianGenerator/dock.tscn").instance()
var file = File.new()
var data_path = OS.get_data_dir() + "/PersianGodotPlugin/persian.plugin.data"
var data = {
	"InBtmPnl":true
}

func _enter_tree():
	var dir = Directory.new()
	if not dir.dir_exists(data_path.get_base_dir()):
		dir.make_dir(data_path.get_base_dir())
	if file.file_exists(data_path):
		file.open_compressed(data_path,File.READ,File.COMPRESSION_GZIP)
		data = parse_json(file.get_as_text())
		file.close()
	if data.InBtmPnl:
		add_control_to_bottom_panel(dock,"Persian")
	else:
		add_control_to_dock(EditorPlugin.DOCK_SLOT_LEFT_BL,dock)

func _exit_tree():
	if data.InBtmPnl:
		remove_control_from_bottom_panel(dock)
	else:
		remove_control_from_docks(dock)
	dock.queue_free()
