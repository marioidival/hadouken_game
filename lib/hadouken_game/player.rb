require 'gosu'

class Player
  attr_accessor :character

  def initialize window = nil # -> To test
    @character = choice_character
    @name = @character[:name].capitalize
    @image = @character[:image]

    if window
      @player_image = Gosu::Image.new window, @image, false
    end

  end

  def push_hadouken
    # Retorna o valor do 'click' do personagem
    @character[:hit_value]
  end

  def characters
    # Retorna uma lista com os possiveis personagens do jogo
    # @return Array
    [
        {name: "italo", hit_value: 5, image: "imagem.png"},
        {name: "helen", hit_value: 1, image: "imagem.png"},
        {name: "mateus", hit_value: 5, image: "imagem.png"},
        {name: "marisa", hit_value: 1, image: "imagem.png"},
        {name: "julian", hit_value: false, image: "imagem.png"},
        {name: "debora", hit_value: 1, image: "imagem.png"},
        {name: "arisson", hit_value: false, image: "imagem.png"},
        {name: "eduardo", hit_value: 1, image: "imagem.png"},
    ]
  end

  def choice_character
    # Retorna um personagem aleatorio
    # @return Hash
    characters[rand(characters.size)]
  end

end
