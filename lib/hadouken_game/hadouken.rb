class Hadouken
  attr_reader :images_hadouken

  def initialize window=nil, player
    @player = player

    if window
      @window = window
      @hadouken_img = Gosu::Image.new @window, self.images_hadouken(@player.name), false
    end
  end

  # Desenha o hadouken do personagem
  def draw_hadouken
    @center_y = @window.height / 2
    # left
    @hadouken_img.draw(
      @player.player_x - 10, @center_y, 1, -1
    ) if @player.player2?
    # right
    @hadouken_img.draw(
      @player.player_x + 10, @center_y, 1
    ) unless @player.player2?
  end

  # Retorna imagem do hadouken do personagem passado por parametro
  def images_hadouken player_name
    images = {
      helen: 'hadouken_game/media/hadouken/img.jpg',
      mateus: 'hadouken_game/media/hadouken/img.jpg',
      julian: 'hadouken_game/media/hadouken/img.jpg',
      debora: 'hadouken_game/media/hadouken/img.jpg',
      luciano: 'hadouken_game/media/hadouken/img.jpg',
      marisa: 'hadouken_game/media/hadouken/img.jpg',
      arisson: 'hadouken_game/media/hadouken/img.jpg',
      italo: 'hadouken_game/media/hadouken/img.jpg',
      eduardo: 'hadouken_game/media/hadouken/img.jpg',
      wendel: 'hadouken_game/media/hadouken/img.jpg',
    }
    images[player_name]
  end
end
