extends Area2D

# Exports para configurar desde el editor
export(int) var impulse_strength = 75
export(int) var horizontal_speed = 50
export(int) var speed_increment = 5
export(int) var gravity = 980

var alive = true
var velocity = Vector2()

# Input buffering
var input_buffer = false
var buffer_time = 0.1
var buffer_timer = 0.0

func _ready():
	# Conectar señales de colisión
	connect("body_entered", self, "_on_body_entered")
	connect("area_entered", self, "_on_area_entered")
	
	# Configurar input
	set_process_input(true)

func getZoom():
	return $Camera2D.zoom.y

func _physics_process(delta):
	if not alive:
		return
	
	# Procesar input buffer
	if input_buffer:
		buffer_timer -= delta
		if buffer_timer <= 0:
			input_buffer = false

	# Movimiento horizontal constante
	velocity.x = horizontal_speed
	
	# Aplicar gravedad
	velocity.y += gravity * delta
	
	# Limitar velocidad de caída (opcional)
	velocity.y = min(velocity.y, 400)
	
	# Mover el pájaro
	global_position += velocity * delta
	
	# Actualizar límites
	var limites = get_tree().get_nodes_in_group("limites")
	if limites.size() > 0:
		limites[0].global_position.x = global_position.x

func bird_up():
	if not alive: pass
		
	# Resetear velocidad vertical y aplicar impulso hacia arriba
	velocity.y = -impulse_strength
	
	$AnimationPlayer.play("BirdAnimation")
	
	$wing.play()

	
# Detección de colisiones simplificada
func _on_body_entered(body):
	if body.is_in_group("kill") and alive: die()

func _on_area_entered(area):
	if area.is_in_group("kill") and alive: die()
		
func die():
	alive = false
	$AnimationPlayer.stop()
	velocity.x = 0  # Detener movimiento horizontal
	$hit.play()
	$AnimatedSprite.flip_v = true
	
	# Llamar al fin del juego
	var main = get_tree().get_nodes_in_group("main")
	if main.size() > 0:
		main[0].fin_juego()

func _set_animation(pos):
	$AnimatedSprite.animation=pos

# ✅ SISTEMA DE INPUT MEJORADO
func _input(event):
	if not alive:
		return
	
	# Detectar diferentes tipos de input
	var should_jump = false
	
	# Touch input (móviles)
	if event is InputEventScreenTouch and event.pressed:
		should_jump = true
		
	# Mouse input (PC)
	elif event is InputEventMouseButton and event.pressed and event.button_index == BUTTON_LEFT:
		should_jump = true
		
	# Keyboard input (PC)
	elif event is InputEventKey and event.pressed:
		if event.scancode == KEY_SPACE or event.scancode == KEY_UP:
			should_jump = true
	
	# Ejecutar salto con buffer
	if should_jump:
		jump_with_buffer()

func jump_with_buffer():
	# Input buffering - permite input anticipado
	input_buffer = true
	buffer_timer = buffer_time
	
	# Salto inmediato
	bird_up()
	
	# Feedback visual adicional (opcional)
	add_screen_shake()

func add_screen_shake():
	# Pequeño screen shake para feedback
	var camera = $Camera2D
	var original_pos = camera.position
	
	# Shake rápido
	camera.position = original_pos + Vector2(rand_range(-2, 2), rand_range(-2, 2))
	
	# Volver a posición original
	var tween = create_tween()
	tween.tween_property(camera, "position", original_pos, 0.1)
