require 'gosu'
require_relative 'scenario'

class GameWindow < Gosu::Window
  def initialize
    super 1024, 760, false

    # Titulo da janela
    self.caption = "Hadouken Game"

    @background = Gosu::Image.new self, Scenario.new, true
  end


  def draw
    @background.draw # Desenhando o cenario

  end
end
