require 'gosu'

class Player
  attr_accessor :character

  def initialize window = nil, is_second = false
    @character = choice_character
    @name = @character[:name].capitalize
    @image = @character[:image]
    @is_second = is_second

    if window
      @window = window
      @player_image = Gosu::Image.new @window, @image, false

      # Definindo variaveis de posicoes
      @center_x = @window.width / 2
      @center_y = @window.height / 2

      @player_x = @is_second ? @center_x + @player_image.width * 4 : @center_x - @player_image.width * 4
    end

  end

  def player2?
    @is_second
  end

  def push_hadouken
    # Retorna o valor do 'click' do personagem
    @character[:hit_value]
  end

  def characters
    # Retorna uma lista com os possiveis personagens do jogo
    # @return Array
    [
        {name: "helen", hit_value: 1, image: "hadouken_game/media/helen.jpg"},
        {name: "mateus", hit_value: 5, image: "hadouken_game/media/mateus.jpg"},
        {name: "julian", hit_value: false, image: "hadouken_game/media/julian.jpg"},
        {name: "debora", hit_value: 1, image: "hadouken_game/media/debora.jpg"},
        {name: "luciano", hit_value: 1, image: "hadouken_game/media/luciano.jpg"},
   #     {name: "marisa", hit_value: 1, image: "imagem.png"},
   #     {name: "italo", hit_value: 5, image: "imagem.png"},
   #     {name: "arisson", hit_value: false, image: "imagem.png"},
   #     {name: "eduardo", hit_value: 1, image: "imagem.png"},
   #     {name: "wendel", hit_value: 1, image: "noimage.png"},
    ]
  end

  def choice_character
    # Retorna um personagem aleatorio
    # @return Hash
    characters[rand(characters.size)]
  end

  # Gosu Methods
  def draw
    @player_image.draw @player_x, @center_y, 1 unless player2?
    @player_image.draw @player_x, @center_y, 1, -1 if player2?
  end

end
