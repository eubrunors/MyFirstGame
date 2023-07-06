/* 
Cria os sprites do jogo:
- struct com principais variaveis
- carregamento de imagens
- atribuindo-os a um sprite
*/
Type _Player
	id as integer		
	x as float			
	y as float			
EndType
Type _Inimigo
	id as integer		
	x as float			
	y as float			
	speed as integer	
EndType
Type _Lazer	
	id as integer	
	x as float			
	y as float			
	fired as integer	
EndType
Type _Estrela
	id as integer		
	width as integer	
	height as integer	
EndType

LoadSprites:
	GoSub LoadImages
	GoSub CreatePlayer
	GoSub CreateLazer
	GoSub CreateInimigo
	GoSub Pontos
	GoSub Recorde
	Return

LoadImages:
	LoadImage(1, "player_ship.png")
	LoadImage(2, "lazer.png")
	LoadImage(3, "download.png")
	Return

CreatePlayer:
	player as _Player
	player.id = 101
	CreateSprite(player.id, 1)
	player.x = 330														// coloca o jogador no meio da tela em relação a x
	player.y = GetVirtualHeight() - GetSpriteHeight(player.id) - 50		// coloca o jogador na parte inferior da tela em relação a y
	SetSpritePosition(player.id, player.x, player.y)
	Return

CreateLazer:
	lazer as _Lazer
	lazer.id = 102
	lazer.x = -100
	lazer.fired = 0
	CreateSprite(lazer.id, 2)
	SetSpritePosition(lazer.id, lazer.x, FORA_DE_TELA)
	Return

/* Cria 3 naves inimigas e coloca elas no topo da tela */
CreateInimigo:

	dim inimigo[3] as _Inimigo
	distancia_entre_inimigos =  250
// meio
	inimigo[1].id = 103
	CreateSprite(inimigo[1].id, 3)
	SetSpriteSize(inimigo[1].id, 100,100)
	inimigo[1].x = (GetVirtualWidth() - GetSpriteWidth(inimigo[1].id)) / 2
	inimigo[1].y = INIMIGO_Y_POSITION
	
	SetSpritePosition(inimigo[1].id, inimigo[1].x, inimigo[1].y)
// esquerda
	inimigo[2].id = 104
	CreateSprite(inimigo[2].id, 3)
	SetSpriteSize(inimigo[2].id, 100,100)
	inimigo[2].x = GetSpriteX(inimigo[1].id) - distancia_entre_inimigos 
	inimigo[2].y = INIMIGO_Y_POSITION
	SetSpritePosition(inimigo[2].id, inimigo[2].x, inimigo[2].y)
// direita
	inimigo[3].id = 105
	CreateSprite(inimigo[3].id, 3)
	SetSpriteSize(inimigo[3].id, 100,100)
	inimigo[3].x = GetSpriteX(inimigo[1].id) + distancia_entre_inimigos 
	inimigo[3].y = INIMIGO_Y_POSITION
	SetSpritePosition(inimigo[3].id, inimigo[3].x, inimigo[3].y)
	Return
	
Pontos:
	CreateText(1, "Pontos: " + str(Pontos))
	SetTextSize(1, 35)
	SetTextPosition(1, 100, 0)
	Return
	
Recorde:
	CreateText(4, "Recorde: " + str(Recorde))
	SetTextSize(4, 35)
	SetTextPosition(4, 650 - GetTextTotalWidth(4) , 0)
	Return
