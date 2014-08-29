require 'gosu'
require_relative 'scenario'
require_relative 'player'

class GameWindow < Gosu::Window
  WIDTH = 1024
  HEIGHT = 771

  def initialize
    super WIDTH, HEIGHT, false

    # Titulo da janela
    self.caption = "Hadouken Game"

    scenario = Scenario.new
    @background = Gosu::Image.new self, scenario.scenario, true
  end


  def draw
    @background.draw(0, 0, 0) # Desenhando o cenario
  end

  def button_down id
    close if id == Gosu::KbEscape
  end
end
