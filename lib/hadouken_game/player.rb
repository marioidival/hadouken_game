require 'gosu'

class Player
  attr_accessor :type_player, :character

  def initialize window = nil
    @character = choice_character
    @name = @character[:name].capitalize
    @image = @character[:image]
  end

  def push_hadouken
    @character[:hit_value]
  end

  def characters
    [
        {name: "mateus", hit_value: 5, image: "imagem.png"},
        {name: "marisa", hit_value: 1, image: "imagem.png"},
        {name: "julian", hit_value: false, image: "imagem.png"},
        {name: "italo", hit_value: 5, image: "imagem.png"},
        {name: "helen", hit_value: 1, image: "imagem.png"},
        {name: "arisson", hit_value: false, image: "imagem.png"},
        {name: "eduardo", hit_value: 1, image: "imagem.png"},
        {name: "debora", hit_value: 1, image: "imagem.png"}
    ]
  end

  def choice_character
    characters[rand(characters.size)]
  end

end
