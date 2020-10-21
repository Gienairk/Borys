extends KinematicBody2D

var cd=0
var speed=320;
var Vtop=Vector2(0,-1);
var vel=Vector2();
var Right=true

#заранее подгружаем пулю, вызываем ее от игрока со смещением
#и мощью из 2 параметра impulse
# разбил стрельбу по разным сторонам

func _physics_process(delta):

	#мыш
	


	if Input.is_action_pressed('ui_left'):
		vel.x=-speed
	elif Input.is_action_pressed('ui_right'):
		vel.x=speed
	else:
		vel.x=0
	if Input.is_action_pressed('ui_up'):
		vel.y=-speed
	elif Input.is_action_pressed('ui_down'):
		vel.y=speed
	else:
		vel.y=0

	vel =move_and_slide(vel,Vtop)

	var cnt = get_slide_count()-1 # количество обьектов соприкасновения
	if cnt >= 0:
		var col = get_slide_collision(cnt)
		# контролирую есть ли у обьекта столкновения метод убить и если есть умираю
		if col && col.collider.has_method('killHero'):
			queue_free()
			print('RIP')
		# контролирую есть ли у обьекта столкновения метод умереть и если есть вызываю данный метод в нем, без проверки все идет по звезде
		#if col && col.collider.has_method('kill'):
		#	col.collider.call('kill')
func killHero():
	queue_free()
	print('killHero')