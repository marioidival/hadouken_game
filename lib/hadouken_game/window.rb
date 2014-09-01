require 'gosu'
require_relative 'scenario'
require_relative 'hadouken'
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
    @player = Player.new self
    @player2 = Player.new self, true

    @hadouken = Hadouken.new self, @player
    @hadouken2 = Hadouken.new self, @player2
  end


  def draw
    @background.draw(0, 0, 0) # Desenhando o cenario
    @player.draw
    @player2.draw

    @hadouken.draw_hadouken
    @hadouken2.draw_hadouken
  end

  def button_down id
    close if id == Gosu::KbEscape
  end
end
