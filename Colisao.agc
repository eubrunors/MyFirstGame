Colisao:
	Gosub ColisaoLazer      // Chama o subprocedimento para verificar colisões entre os tiros e os inimigos
	Gosub ColisaoPlayer     // Chama o subprocedimento para verificar colisões entre o jogador e os inimigos
	Return
	
ColisaoLazer:
	for i = 1 to inimigo.length
		if GetSpriteCollision(lazer.id, inimigo[i].id) = 1    // Verifica se ocorreu colisão entre o tiro e o inimigo
			PlaySound(explosion_sound)    // Reproduz o som de explosão
			Pontos = Pontos + 10    // Incrementa os pontos do jogador
			setSpriteY(inimigo[i].id, FORA_DE_TELA)    // Move o inimigo para fora da tela
			lazer.fired = 0    // Reinicia o tiro
			lazer.x = FORA_DE_TELA
			lazer.y = FORA_DE_TELA
		endif
	next i
	Return

ColisaoPlayer:
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


