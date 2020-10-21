extends RigidBody2D

var progres=1
var pr=true
func _ready():
	
	set_linear_velocity(Vector2(-0.00000001, 0))

func _physics_process(delta):
	#var flag=randi()%11+1
	#if (flag>5 && pr==true):
	#	progres=1
	#	print("туда")
	#if(flag<=5 && pr==true):
		#progres=-1
		#print("сюда")
	#pr=false
	set_linear_velocity(Vector2(0, 450))

func killEnemy():
	queue_free()
	print('killEnemy')

func killHero():
	print('killHero')