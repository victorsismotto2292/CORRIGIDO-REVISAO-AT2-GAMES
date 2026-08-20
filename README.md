# INSTRUÇÕES DAS FASES
# FASE 1 

Porta com problema com sinal vindo da bandeira para passar de fase

SOLUÇÃO: Conectar um sinal body_entered() na bandeira para emitir uma função de "desaparecer" da porta, evitando sua colisão e mudando sua opacidade na fase para 0%
#
# FASE 2

Tilemap incompleto, personagem não consegue avançar pois tem um buraco separando a plataforma de spawn e a porta que contém o fragmento teleportável à próxima fase

SOLUÇÃO: Selecionar o TileMapLayer da cena, ir na aba "TileMap", selecionar os TileMaps correspondentes da plataforma e, com a ferramenta de pintura, preencher os espaços vazios e conectar a plataforma de spawn com a plataforma do pragmento.

# FASE 3

Personagem precisa detectar um objeto ao chão para liberar a passagem de uma porta

SOLUÇÃO: inserir ou ajustar o RayCast2D que detecte objetos colidíveis no chão observável
