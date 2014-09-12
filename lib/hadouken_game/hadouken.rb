class Hadouken
  attr_reader :images_hadouken

  def initialize window=nil, player
    @player = player

    if window
      @window = window
      @hadouken_img = Gosu::Image.new @window, images_hadouken(@player.name), false

      @center_y = @window.height / 2
      @mov = 130
    end
  end

  # Desenha o hadouken do personagem
  def draw_hadouken
    # left
    @hadouken_img.draw(
      @player.player_x - @mov, @center_y, 1, -1
    ) if @player.player2?
    # right
    @hadouken_img.draw(
      @player.player_x + @mov, @center_y, 1
    ) unless @player.player2?
  end

  # Retorna imagem do hadouken do personagem passado por parametro
  def images_hadouken player_name
    images = {
      "helen"=> 'hadouken_game/media/helen.jpg',
      "mateus"=> 'hadouken_game/media/mateus.jpg',
      "julian"=> 'hadouken_game/media/julian.jpg',
      "debora"=> 'hadouken_game/media/debora.jpg',
      "luciano"=> 'hadouken_game/media/luciano.jpg',
     # "marisa"=> '',
     # "arisson"=> '',
     # "italo"=> '',
     # "eduardo"=> '',
     # "wendel"=> '',
    }
    images[player_name]
  end

  def move_hadouken
    # Movimentacao do hadouken a cada clique
    @mov = @mov + (@player.push_hadouken * 30)
  end

  def crush_hadouken
  end

  def draw
    self.draw_hadouken
  end

end
