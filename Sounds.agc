LoadSounds:
	GoSub LoadSoundEffectFiles
	GoSub LoadMusicFiles
Return

LoadSoundEffectFiles:
	explosion_sound = LoadSound("explosion.wav")
	lazer_sound = LoadSound("laser.wav")
Return

LoadMusicFiles:
	music = LoadMusicOGG("music.ogg")
Return
