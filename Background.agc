CriaEstrela:
	dim estrelas[100] as _Estrela
	CreateImageColor(5, 255, 255, 255, 255)	// CRIA BLOCO BRANCO PRA SER A ESTRELA 

	for i = 1 to estrelas.length	//CRIA 100 ESTRELAS
		estrelas[i].id = i
		estrelas[i].width = 2
		estrelas[i].height = 2
		CreateSprite(estrelas[i].id, 5)
		SetSpriteSize(estrelas[i].id, estrelas[i].width, estrelas[i].height)
		SetSpritePosition(estrelas[i].id, Random(1, LARGURA_WINDOW), Random(1, ALTURA_WINDOW))
	next i
	Return

EstrelaMovimento:
	for i = 1 to estrelas.length
		EstrelaY = GetSpriteY(estrelas[i].id) + Random(3, 10)
		if EstrelaY > ALTURA_WINDOW
			EstrelaY = 0
		endif
		SetSpritePosition(estrelas[i].id, GetSpriteX(estrelas[i].id), EstrelaY)
	next i
	Return
