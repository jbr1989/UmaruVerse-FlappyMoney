extends Container

func setValues(user, score, time):
	$User.text = user
	$Score.text = str(score)
	$Time.text = str(time)
