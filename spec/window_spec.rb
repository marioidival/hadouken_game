require 'minitest/autorun'
require_relative '../lib/hadouken_game/window'

describe "GameWindow", "A class da tela do jogo" do

  before do
    @window = HadoukenGame::GameWindow.new
  end

  it "A tela devera ser do tamanho de 1024x760" do
    @window.width.must_equal 1024
    @window.height.must_equal 760
  end

  it "A titulo da tela tem que ser 'Hadouken Game'" do
    @window.caption.must_equal "Hadouken Game"
  end

  it "A tela nao devera ser fullscreen" do
    @window.wont_be :==, true
  end

end
