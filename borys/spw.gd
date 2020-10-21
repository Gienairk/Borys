extends Position2D

export (PackedScene) var spawnScene
onready var spawnReferece = load (spawnScene.get_path())

export(NodePath) var timerPath
onready var timer = get_node(timerPath)

export(float) var minWaitTime
export(float) var maxWaitTime
func _ready():
	randomize()
	timer.set_wait_time(rand_range(minWaitTime,maxWaitTime))
	timer.start()
#	print('го')
	


func _on_timer_timeout():
	#print('гоу')
	var spawnInstance = spawnReferece.instance()
	spawnInstance.position=$point.position
	$".".add_child(spawnInstance)

	#var plase= get_parent()
	#get_parent().add_child(spawnInstance)
	#spawnInstance.set_pos(plase)
	
	timer.set_wait_time(rand_range(minWaitTime,maxWaitTime))
	timer.start()
