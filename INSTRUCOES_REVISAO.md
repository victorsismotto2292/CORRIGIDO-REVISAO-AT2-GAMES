# Trilha de Revisão — Godot

**Objetivo:** cada fase tem um pequeno problema para você resolver. Resolver a fase
**destrava a próxima**. Complete **todas as 11 fases** para ganhar o bônus!

- **Jogar:** aperte **F5** (começa pelo menu). Mover: **A/D** ou setas. Pular: **Espaço**.
- **Consertar:** quando travar numa fase, vá ao editor, conserte a cena daquela fase
  (`cenas/cenaNN.tscn`) e rode de novo.
- O enunciado de cada fase também aparece no **canto superior direito da tela** (HUD).
- Você sempre recomeça do início ao rodar — vá avançando fase por fase.
- Ao chegar na tela **"Parabéns"**, chame o professor para validar o seu prêmio.

---

## As fases

| Fase | Assunto | O que está acontecendo |
|---|---|---|
| 1 | Sinais | A **flag** deveria abrir o portão, mas não faz nada. Faça-a funcionar. |
| 2 | TileMapLayer | Falta um **pedaço do chão**. Complete o caminho até o outro lado. |
| 3 | Raycast | A placa está "olhando" para o **lado errado**. Ajuste a direção do sensor. |
| 4 | Animação + Tecla | Um **super pulo** deveria te levar até o fragmento lá em cima, mas a tecla não está mapeada — e falta criar a animação de pulo pra ele funcionar. |
| 5 | PowerUp + Sinais | Um poder deveria te dar um **impulso (dash)**, mas nada acontece ao tocá-lo — e a tecla do dash também não está mapeada. |
| 6 | Sinais | A flag abre o **portão errado**. Ligue-a ao portão certo. |
| 7 | TileMapLayer | O fragmento está **lá em cima**. Construa uma escada de tiles. |
| 8 | Inimigo (Raycast) | O inimigo deveria **patrulhar** a plataforma, mas está parado. Sem ele andar, a passagem não abre. |
| 9 | Animação + Código | A flag aciona o portão, mas **nada acontece**. Falta criar uma variável e usar o comando de tocar a animação. |
| 10 | Cena nova + Colisor | Falta **construir um trecho do caminho** (crie os nós do zero) — e um colisor por perto está do **tamanho errado**. |
| 11 | HUD + Código | Um placar de **moedas** não soma nada. Falta criar uma variável e escrever o código que soma os pontos. |

> Dica geral: use a aba **Nó → Sinais** e o painel **Inspetor** no editor. Leia também
> a aba **Saída** quando algo não funcionar.

## Dicas específicas

**Fase 4 (Super pulo):** existe um penhasco alto que só um "super pulo" atravessa.
Duas coisas faltam: (a) em **Projeto → Configurações do Projeto → Mapa de Entrada**,
adicione uma tecla à ação **`super_pulo`** (ela existe, mas está sem tecla); (b)
selecione o **`AnimatedSprite2D`** dentro do nó `Player`, abra o painel
**SpriteFrames** e crie uma animação nova chamada **`pular`**, com pelo menos 2
quadros usando sprites de cores diferentes do personagem (ex.
`character_roundGreen` e `character_roundYellow`, em `recursos/PNG/Default/`).
Com as duas prontas, corra até a beirada e aperte a tecla do super pulo — o pulo
normal (Espaço) não é alto o bastante.

**Fase 5 (PowerUp):** o PowerUp tem um sinal `body_entered` não conectado — conecte-o
a ele mesmo (método `_on_body_entered`). Depois, vá em **Projeto → Configurações do
Projeto → Mapa de Entrada** e adicione uma tecla à ação **`dash`** (ela existe, mas
está sem tecla). Com os dois resolvidos, toque no PowerUp e aperte a tecla do dash
perto do vão para atravessar.

**Fase 9 (Porta animada):** abra `scripts/porta_animada.gd`. Falta criar uma
variável que guarde a referência do **`AnimationPlayer`** do nó (dica:
`@onready var ... = $AnimationPlayer`) e, na função `acionar()` (hoje só tem
um `pass`), chamar o método que toca uma animação nessa variável, usando o
nome da animação que já existe pronta: **`"abrir"`**.

**Fase 10 (Cena nova):** perto do vão maior existe um nó vazio marcado **"Construa
aqui"**. Adicione ali um **StaticBody2D** com um **Sprite2D** (visual) e um
**CollisionShape2D** (colisão, do tamanho do vão) como filhos, para criar uma
plataforma nova. Antes disso, também tem uma ponte já pronta cujo colisor está
**pequeno/deslocado demais** — ajuste o tamanho/posição dele no Inspetor.

**Fase 11 (Placar de moedas):** abra `scripts/hud_pontuacao.gd`. Falta criar uma
variável **inteira** pra guardar a pontuação (começando em 0) e completar a
função `somar_ponto()` (hoje ela só tem um `pass`) — ela deve **somar 1** na
variável e **atualizar o texto** do `label_pontos` com o novo valor. Uma porta
bloqueia o caminho até o fragmento e só abre quando o placar realmente
funcionar — colete uma moeda pra testar.

Bom trabalho! 🎮
