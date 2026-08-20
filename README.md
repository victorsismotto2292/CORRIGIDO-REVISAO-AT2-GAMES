# INSTRUÇÕES DAS FASES
# FASE 1 

Porta com problema com sinal vindo da bandeira para passar de fase

SOLUÇÃO: Conectar um sinal body_entered() na bandeira para emitir uma função de "desaparecer" da porta, evitando sua colisão e mudando sua opacidade na fase para 0%
#
# FASE 2

Tilemap incompleto, personagem não consegue avançar pois tem um buraco separando a plataforma de spawn e a porta que contém o fragmento teleportável à próxima fase

SOLUÇÃO: Selecionar o TileMapLayer da cena, ir na aba "TileMap", selecionar os TileMaps correspondentes da plataforma e, com a ferramenta de pintura, preencher os espaços vazios e conectar a plataforma de spawn com a plataforma do pragmento.
#
# FASE 3

Personagem precisa detectar um objeto ao chão para liberar a passagem de uma porta

SOLUÇÃO: inserir ou ajustar o RayCast2D que detecte objetos colidíveis no chão observável
#
# FASE 4

Personagem precisa dar um super-pulo para subir na plataforma e adquirir o fragmento

SOLUÇÃO: adicionar uma tecla com funcionalidade do super-pulo em "PROJETO/CONFIGURAÇÕES DO PROJETO", em seguida, adicionar uma animação de pulo para o personagem (script adicionado pelo professor, obrigado 🙏)
#
# FASE 5

Personagem precisa dar um dash e evitar cair no buraco

SOLUÇÃO: Aplicar a habilidade "dash" a uma tecla especifica em "PROJETO/CONFIGURAÇÕES DO PROJETO", em seguida, adicionar um conector ao powerup "body_entered" nele mesmo
#
# FASE 6

Sinal da bandeira está conectado na porta errada

SOLUÇÃO: editar o conector para a porta correta nos sinais da bandeira
#
# FASE 7

Fragmento está em cima de uma plataforma que o personagem não consegue alcançar

SOLUÇÃO: com os tilemaps atribuidos, construir uma escada que leva até o fragmento
#
# FASE 8

Inimigo precisa andar para ativar a plataforma e liberar a passagem, mas está parado

SOLUÇÃO: No script do inimigo, ajustar o valor da sua velocidade para um número positivo diferente de zero, para que ele possa se locomover
#
# FASE 9

A bandeira ativa a porta, mas a porta não recebe nenhum sinal de animação

SOLUÇÃO: no script da bandeira, criar uma variável referencial ao AnimationPlayer da porta e usá-la dentro da função acionar(), que emite uma função da animação "abrir", própria à porta animada
#
# FASE 10

Ponte quebrada incompleta e personagem não tem colisão com ela

SOLUÇÃO: ajustar CollisionShape2D da primeira ponte e adicionar, dentro do Node2D solicitado pelo professor dentro do projeto, um StaticBody2D, contendo um Sprite2D com a textura da ponte e um CollisionShape2D com um formato retangular, em seguida, ajustar posição e comprimento que conectem à ponte principal
#
# FASE 11

Hud não atualiza pontuação quando personagem pega as moedas

SOLUÇÃO: criar uma variável de pontuação dentro do script "HUD_PONTUAÇÃO.GD", em seguida, dentro da função de soma, adicionar um incremento e transformá-lo em string que será exibido no HUD corretamente
#
