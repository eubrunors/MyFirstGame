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

/* struct com principais variaveis  */

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

/* inicializar variaveis  */
pontos = 0				
recorde = 0			
gameover = 1			
cria_menu = 0		

GoSub CriaEstrela
GoSub LoadSprites
GoSub Pontos
GoSub LoadSounds

/* Loop Principal */
do
	if gameover = 1
		GoSub MenuPrincipal
		score = 0
	endif
	
    GoSub PlayerMove
	GoSub PlayerShoots
	GoSub InimigoMovimento
	GoSub MortePlayer
	GoSub EstrelaMovimento
	
	SetTextString(1, "Pontos: " + str(pontos))
	if Pontos > Recorde
		Recorde = Pontos
	endif
	
	SetTextString(4, "Recorde: " + str(recorde))
	SetTextPosition(4, 768 - GetTextTotalWidth(4) , 0)
	GoSub Colisao
	
    Sync()
loop
