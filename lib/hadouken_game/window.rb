require 'gosu'

class GameWindow < Gosu::Window
  def initialize
    super 1024, 760, false

    # Titulo da janela
    self.caption = "Hadouken Game"
  end
end
