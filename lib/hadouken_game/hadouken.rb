class Hadouken
  attr_accessor :hadouken_img
  attr_reader  :center_y, :center_x

  def initialize window=nil, player
    @player = player

    if window
      @window = window
      @hadouken_img = Gosu::Image.new @window, images_hadouken(@player.name), false

      @center_y = @window.height / 2
      @mov = 130

      @center_x = @player.player_x - @mov if @player.player2?
      @center_x = @player.player_x + @mov unless @player.player2?
    end

  end

  # Desenha o hadouken do personagem
  def draw_hadouken
    # left
    if @player.push_hadouken
      @hadouken_img.draw(@player.player_x - @mov, @center_y, 1, -1) if @player.player2?
      # right
      @hadouken_img.draw(@player.player_x + @mov, @center_y, 1) unless @player.player2?

      @center_x = @player.player_x - @mov if @player.player2?
      @center_x = @player.player_x + @mov unless @player.player2?
    end
  end

  # Retorna imagem do hadouken do personagem passado por parametro
  def images_hadouken player_name
    images = {
      "helen"=> 'hadouken_game/media/hadouken/helen_hadouken.png',
      "mateus"=> 'hadouken_game/media/hadouken/mateus_hadouken.png',
      "marisa"=> 'hadouken_game/media/Hadouken/marisa_hadouken.png',
      "italo"=> 'hadouken_game/media/hadouken/italo_hadouken.png',
      "luciano"=> 'hadouken_game/media/hadouken/luciano_hadouken.png',
      "julian"=> 'hadouken_game/media/julian.jpg',
      "eduardo"=> 'hadouken_game/media/hadouken/eduardo_hadouken.png',
      "debora"=> 'hadouken_game/media/hadouken/debora_hadouken.png',
      "wendel"=> 'hadouken_game/media/hadouken/wendell_hadouken.png',
      "arisson"=> 'hadouken_game/media/arisson.png',
    }
    images[player_name]
  end

  def move_hadouken
    # Movimentacao do hadouken a cada clique
    if @player.push_hadouken
      @mov = @mov + (@player.push_hadouken * 30)
    else
      @player.push_hadouken
    end

    # se o hadouken sair do tamanho da tela, retorna o hadouken
    # para posicao original
    if @mov > @window.width
      @mov = 130
    end
  end

  def crush_hadouken
  end

  def die!
    @center_y = 0
    @center_x = 0
    @hadouken_img = nil
  end

  def draw
    # Verificar se o player tem o hit_value igual a false
    # Se tiver, Game Over para ele.
    self.draw_hadouken if @hadouken_img != nil
  end

end
