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

    if @player.push_hadouken
      @hadouken.draw
    end

    if @player2.push_hadouken
      @hadouken2.draw
    end
  end

  def update
    @hadouken.move_hadouken if button_down?(Gosu::KbQ)
    @hadouken2.move_hadouken if button_down?(Gosu::KbP)
  end

  def button_down id
    close if id == Gosu::KbEscape
  end
end
