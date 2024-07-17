extends CharacterBody2D

@onready var urm_2d:URM2D = $URM2D
var input_direction:Vector2

## Con esta forma se obtiene el vector ya normalizado
func set_input_direction():
	input_direction = Input.get_vector('ui_left', 'ui_right', 'ui_up', 'ui_down')

## Otra forma de obtener la direccion (necesario normalizar)
func input_axis_direction():
	input_direction.x = int(Input.is_action_pressed('ui_right')) - int(Input.is_action_pressed('ui_left'))
	input_direction.y = int(Input.is_action_pressed('ui_down')) - int(Input.is_action_pressed('ui_up'))
	
func _physics_process(delta: float) -> void:
	move()
	#move_2()
	pass

func move():
	set_input_direction()
	## normalize en true:
	#input_axis_direction()
	urm_2d.direction_2d = input_direction
	## Para saber la direccion:
	#urm_2d.get_velocity()
	urm_2d.move()

##Otra funcion para mover y usar solo la velocidad de nuestro componente:
func move_2():
	set_input_direction()
	urm_2d.direction_2d = input_direction
	velocity = urm_2d.get_velocity()
	move_and_slide()


func _on_timer_timeout() -> void:
	urm_2d.stop_movement()
