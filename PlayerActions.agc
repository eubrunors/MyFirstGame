PlayerAction:
	GoSub PlayerMove      // Chama o subprocedimento para mover o jogador
	GoSub PlayerShoots    // Chama o subprocedimento para disparar tiros
	GoSub InimigoMovimento    // Chama o subprocedimento para movimentar os inimigos
	Return
	
PlayerMove:

	player.x = player.x + GetDirectionX() * PLAYER_SPEED    // Atualiza a nova posição x do jogador
	if player.x < 0    // Impede o jogador de sair pela borda esquerda da tela
		player.x = 0
	endif
	if player.x > GetVirtualWidth() - GetSpriteWidth(player.id)    // Impede o jogador de sair pela borda direita da tela
		player.x = GetVirtualWidth() - GetSpriteWidth(player.id)
	endif
	SetSpritePosition(player.id, player.x, player.y)    // Atualiza a posição do sprite do jogador

Return

PlayerShoots:

	// Verifica se a tecla de espaço foi pressionada e o tiro não foi disparado ainda
	if GetRawKeyPressed(32) and lazer.fired = 0    
		
		playsound(lazer_sound)    	// Reproduz o som do tiro
		lazer.fired = 1    			// Marca o tiro como disparado
		lazer.x = GetSpriteX(player.id) + GetSpriteWidth(player.id)/2 - GetSpriteWidth(lazer.id) / 2    // Posiciona o tiro no centro do jogador
		lazer.y = GetSpriteY(player.id) - 40    // Posiciona o tiro acima do jogador
	endif
	if lazer.fired = 1    			// Move o tiro para cima na tela (eixo y)
		lazer.y = lazer.y - LAZER_SPEED
	endif
	if lazer.y < -GetSpriteHeight(lazer.id)    // Esconde o tiro quando ele sai da tela e permite disparar um novo tiro
		lazer.fired = 0
	endif
	SetSpritePosition(lazer.id, lazer.x, lazer.y)    // Atualiza a posição do sprite do tiro

Return

InimigoMovimento:
	For i = 1 To inimigo.length
		SetSpritePosition(inimigo[i].id, GetSpriteX(inimigo[i].id), GetSpriteY(inimigo[i].id) + INIMIGO_SPEED)    // Move os inimigos para baixo na tela
	Next i
Return
