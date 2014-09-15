require 'gosu'
require_relative 'scenario'
require_relative 'hadouken'
require_relative 'player'

class GameWindow < Gosu::Window
  @@format = [3, 1.0, 1.0, 0xffffff00]
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

    @explosion = Gosu::Sample.new(self, 'hadouken_game/media/explosion.ogg')
    @font = Gosu::Font.new self, Gosu::default_font_name, 40
  end


  def draw
    @background.draw(0, 0, 0) # Desenhando o cenario
    @player.draw if @player.down?
    @player2.draw if @player2.down?

    if @player.push_hadouken
      @hadouken.draw
    end

    if @player2.push_hadouken
      @hadouken2.draw
    end

    unless @player.down?
      @font.draw "GAME OVER player1", 350, 50, *@@format
    end

    unless @player2.down?
      @font.draw "GAME OVER player2", 350, 50, *@@format
    end
  end

  def update
    playing
  end

  def playing
    dist_hadouken = Gosu::distance(@hadouken.center_x, @hadouken.center_y,
                                   @hadouken2.center_x, @hadouken2.center_y)

    if dist_hadouken < 170 and (@player.push_hadouken and @player2.push_hadouken)
      if @hadouken.hadouken_img and @hadouken2.hadouken_img
        @explosion.play
      end
      @hadouken.die!
      @hadouken2.die!
    end

    hadouken_player = Gosu::distance(@hadouken2.center_x, @hadouken2.center_y,
                                     @player.player_x, @player.center_y)
    hadouken_player2 = Gosu::distance(@hadouken.center_x, @hadouken.center_y,
                                      @player2.player_x, @player2.center_y)
    if hadouken_player < 170
      @player.die!
    end

    if hadouken_player2 < 170
      @player2.die!
    end
  end

  def button_down id
    close if id == Gosu::KbEscape
    if button_down? Gosu::KbQ
      @hadouken.move_hadouken if @hadouken.hadouken_img
      if @player.down?
        @hadouken = Hadouken.new self, @player unless @hadouken.hadouken_img
      end
    end

    if button_down? Gosu::KbP
      @hadouken2.move_hadouken if @hadouken2.hadouken_img
      if @player2.down?
        @hadouken2 = Hadouken.new self, @player2 unless @hadouken2.hadouken_img
      end
    end
  end
end
