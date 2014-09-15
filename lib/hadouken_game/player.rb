require 'gosu'

class Player
  attr_accessor :character, :name, :player_x, :center_y, :player_image
  # A classe player inicializa com 2 argumentos, o primeiro o parametro
  # da Janela, e o segundo informa se o jogador criado e o player2
  # ( segundo jogador )

  def initialize window = nil, is_second = false
    @character = choice_character
    @name = @character["name"]
    @image = @character["image"]
    @is_second = is_second

    if window
      @window = window
      @player_image = Gosu::Image.new @window, @image, false

      # Definindo variaveis de posicoes
      @center_x = @window.width / 2
      @center_y = @window.height / 2

      # Define qual lado o jogador vai estar, se ele for jogador 2
      # ficara na esquerda, senao, direita.
      @player_x = @is_second ? @center_x + @player_image.width * 4 : @center_x - @player_image.width * 4
      @live = true
    end

  end

  def player2?
    # Retorna True ou False, se o personagem
    # e o segundo jogador
    @is_second
  end

  def push_hadouken
    # Retorna o valor do 'click' do personagem
    @character['hit_value']
  end

  def characters
    # Retorna uma lista com os possiveis personagens do jogo
    # @return Array
    [
      {"name"=> "helen", "hit_value" => 3.5, "image" => "hadouken_game/media/helen.jpg"},
      {"name"=> "mateus", "hit_value" => 5, "image" => "hadouken_game/media/mateus.jpg"},
      {"name"=> "julian", "hit_value" => false, "image" => "hadouken_game/media/julian.jpg"},
      {"name"=> "debora", "hit_value" => 3.5, "image" => "hadouken_game/media/debora.jpg"},
      {"name"=> "luciano", "hit_value" => 3.5, "image" => "hadouken_game/media/luciano.jpg"},
      {"name"=> "marisa", "hit_value" => 3.5, "image" => "hadouken_game/media/marisa.png"},
      {"name"=> "italo", "hit_value" => 5, "image" => "hadouken_game/media/italo.png"},
      {"name"=> "arisson", "hit_value" => false, "image" => "hadouken_game/media/arisson.png"},
      {"name"=> "eduardo", "hit_value" => 3.5, "image" => "hadouken_game/media/eduardo.png"},
      {"name"=> "wendel", "hit_value" => 3.5, "image" => "hadouken_game/media/wendell.png"},
    ]
  end

  def choice_character
    # Retorna um personagem aleatorio
    # @return Hash
    characters[rand(characters.size)]
  end

  def die!
    # metodo para "matar" o jogador, define as variaveis para 0
    # e retira a imagem do jogador da tela
    @center_y = 0
    @center_x = 0
    @player_x = 0
    @player_image = nil

    @live = false
  end

  def down?
    # Retorna True ou False se o jogador esta morto
    @live
  end

  # Gosu Methods
  def draw
    # Se o personagem for o jogador 2, desenha a direita
    @player_image.draw @player_x, @center_y, 1, -1 if player2?
    # Senao, a esquerda
    @player_image.draw @player_x, @center_y, 1 unless player2?
  end

end
