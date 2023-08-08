extends ColorRect

var fps = 0
var fps_min = 9999
var fps_max = 0

var memory = 0

func _process(delta):
	fps = Engine.get_frames_per_second()
	fps = Performance.get_monitor(Performance.TIME_FPS)
	fps_min = min(fps, fps_min)
	fps_max = max(fps, fps_max)
	
	memory = round(Performance.get_monitor(Performance.MEMORY_STATIC)/1024/1204)
	
	$fps.text = str(fps)
	$ColorRect/fps_min.text = str(fps_min)
	$ColorRect2/fps_max.text = str(fps_max)
	
	$ColorRect3/memory.text = str(memory) + "MB"
	
