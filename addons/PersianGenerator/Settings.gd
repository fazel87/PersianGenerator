tool
extends WindowDialog

var base_data = {
	"CopyOnGen":false,
	"InBtmPnl":true,
	"FixNums":true
}

onready var CopyOnGen = $VBoxContainer/CopyOnGen
onready var InBtmPnl = $VBoxContainer/InBtmPnl
onready var FixNums = $VBoxContainer/FixNums
onready var OptionsParent = $VBoxContainer

var data_path = OS.get_data_dir() + "/PersianGodotPlugin/persian.plugin.data"
var file = File.new()

func _ready():
	load_settings()

func load_settings():
	if file.file_exists(data_path):
		file.open_compressed(data_path,File.READ,File.COMPRESSION_GZIP)
		base_data = parse_json(file.get_as_text())
		CopyOnGen.pressed = base_data.CopyOnGen
		InBtmPnl.pressed = base_data.InBtmPnl
		FixNums.pressed = base_data.FixNums
		file.close()
	else:
		save_settings()

func save_settings():
	base_data.CopyOnGen = CopyOnGen.pressed
	base_data.InBtmPnl = InBtmPnl.pressed
	base_data.FixNums = FixNums.pressed
	file.open_compressed(data_path,File.WRITE,File.COMPRESSION_GZIP)
	file.store_string(to_json(base_data))
	file.close()

func _on_Settings_confirmed():
	save_settings()
