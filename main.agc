/*
Project: AGK Batalha Espacial 
Aluno: Bruno Ribeiro da Silveira 
*/

#include "Loader.agc"
#include "PlayerActions.agc"
#include "Colisao.agc"
#include "Sounds.agc"
#include "Background.agc"
#include "Menu.agc"

#constant LARGURA_WINDOW = 768
#constant ALTURA_WINDOW = 1024
#constant KEY_SPACE = 32
#constant FORA_DE_TELA = -50
#constant INIMIGO_Y_POSITION = 20
#constant INIMIGO_SPEED = 5
#constant LAZER_SPEED = 12
#constant PLAYER_SPEED = 12

SetWindowTitle("Batalha Espacial")
SetWindowSize(LARGURA_WINDOW, ALTURA_WINDOW, 0)
SetWindowAllowResize(0) 						
SetErrorMode(2)									
SetVirtualResolution(LARGURA_WINDOW, ALTURA_WINDOW) 		
SetOrientationAllowed(1, 1, 1, 1) 						
SetSyncRate(60, 0) 
SetScissor(0, 0, 0, 0) 				

/* inicializar variaveis  */
pontos = 0				
recorde = 0			
gameover = 1			
cria_menu = 0		

GoSub CriaEstrela
GoSub LoadSprites
GoSub LoadSounds

/* Loop Principal */
do
	if gameover = 1
		GoSub MenuPrincipal
	endif
	GoSub PlayerAction
	GoSub EstrelaMovimento
	GoSub PositionPontuacao
	GoSub Colisao
    Sync()
loop


PositionPontuacao:
	SetTextString(1, "Pontos:" + str(pontos))
	SetTextString(4, "Recorde:" + str(recorde))
	GoSub LoadRecorde
Return
	

LoadRecorde:
	if Pontos > Recorde
		Recorde = Pontos
	endif
Return
