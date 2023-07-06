MenuPrincipal:
	if cria_menu = 0
	
		LoadImage(77, "wallpaper.png")
		wallpaper = CreateSprite(77)
		
		CreateText(3,"Batalha Espacial")
		SetTextSize(3, 45)
		SetTextPosition(3,(768-GetTextTotalWidth(3))/2 , 740)


		CreateText(5, "Pressione ESPAÇO para Iniciar")
		SetTextSize(5, 30)
		SetTextPosition(5, (768 - GetTextTotalWidth(5))/2 , 800)
		cria_menu = 1
	endif
	GoSub EscondeSprite
	GoSub MostraTexto
	
	repeat	/* trava a tela ate apertar o espaço */
		sync()
	until ( GetRawKeyPressed(32)  )
	
	

	PlayMusicOGG(music)
	for i = 1 to inimigo.length	/* Redefine a posição das naves inimigas para o topo da tela antes de reiniciar */
		setSpriteY(inimigo[i].id, FORA_DE_TELA)
	next i
	gameover = 0
	
	GoSub MostraSprite
	GoSub EscondeTexto 
	Return



/* Esconde os sprites do jogo:
- esconde naves inimigas
- esconde nave do jogador
- esconde o tiro de lazer
- esconde estrelas */

EscondeSprite:
	SetSpriteVisible(player.id, 0)
	SetSpriteVisible(lazer.id, 0)
	for i = 1 to inimigo.length
		SetSpriteVisible(inimigo[i].id, 0)
	next i	
	for i = 1 to estrelas.length
		SetSpriteVisible(estrelas[i].id, 0)
	next i
	Return

/* Mostra os sprites do jogo:
- mostra nave inimiga
- mostra nave do jogador
- mostra tiro de lazer
- mostra estrelas */

MostraSprite:
	SetSpriteVisible(player.id, 1)
	SetSpriteVisible(lazer.id, 1)
	for i = 1 to inimigo.length
		SetSpriteVisible(inimigo[i].id, 1)
	next i	
	for i = 1 to estrelas.length
		SetSpriteVisible(estrelas[i].id, 1)
	next i
	Return

EscondeTexto:
	SetTextVisible(3, 0)
	SetTextVisible(5, 0)
	SetSpriteVisible(wallpaper,0)
	Return

MostraTexto:
	SetTextVisible(3, 1)
	SetTextVisible(5, 1)
	SetSpriteVisible(wallpaper, 1)
	Return
