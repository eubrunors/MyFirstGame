
Colisao:
	for i = 1 to inimigo.length
		if GetSpriteCollision(lazer.id, inimigo[i].id) = 1	
			PlaySound(explosion_sound)
			Pontos = Pontos + 10
			setSpriteY(inimigo[i].id, FORA_DE_TELA)
			lazer.fired = 0
			lazer.x = FORA_DE_TELA 
			lazer.y = FORA_DE_TELA
			
		endif
		next i
	Return

MortePlayer:
	for i = 1 to inimigo.length

		if GetSpriteCollision(inimigo[i].id, player.id) = 1
			PlaySound(explosion_sound)
			gameover = 1
			StopMusicOGG(music)
			lazer.fired = 0
			Pontos=0
			setSpriteY(inimigo[i].id, FORA_DE_TELA)
			
		endif
		
		if GetSpriteY(inimigo[i].id) > GetVirtualHeight() 
			PlaySound(explosion_sound)
			StopMusicOGG(music)
			gameover = 1
			lazer.fired = 0
			Pontos=0
			setSpriteY(inimigo[i].id, FORA_DE_TELA)
			
		endif
	next i
	Return


