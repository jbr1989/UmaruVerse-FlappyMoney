extends Area2D

# Exports para configurar desde el editor
export(int) var impulse_strength = 75
export(int) var horizontal_speed = 50
export(int) var speed_increment = 5

var alive = true
var velocity = Vector2()

func _ready():
	# Conectar señales de colisión
	connect("body_entered", self, "_on_body_entered")
	connect("area_entered", self, "_on_area_entered")

func getZoom():
	return $Camera2D.zoom.y

func _physics_process(delta):
	if not alive: pass

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
