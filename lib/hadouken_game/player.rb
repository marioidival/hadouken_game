require 'gosu'

class Player
  attr_accessor :type_player, :character

  def initialize
    @character = choice_character
  end

  def push_hadouken
    if @type_player
      5
    else
      1
    end
  end

  def characters
    {
      mateus:
        {special: true, image: "imagem.png"},
      marisa:
        {special: false, image: "imagem.png"},
      julian:
        {special: "argentino", image: "imagem.png"},
      italo:
        {special: true, image: "imagem.png"},
      eduardo:
        {special: false, image: "imagem.png"},
      arisson:
        {special: "silence", image: "imagem.png"},
      luciano:
        {special: false, image: "imagem.png"},
      helen:
        {special: false, image: "imagem.png"}
    }
  end

  def choice_character
    characters.to_a.sample()
  end

end
