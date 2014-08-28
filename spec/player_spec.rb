require 'spec_helper'

describe Player do


  describe "#escolhendo personagem" do
    subject(:player) { Player.new }

    context "#character deve ser um array" do
      it { expect(player.character).to be_a(Hash) }
    end
  end

  describe "#push_hadouken" do
    subject(:player) { Player.new }

    context "personagem comum" do
      def modify_player
        player.character = {name: "marisa", hit_value: 1, image: "imagem.png"}
        player.push_hadouken
      end
      it { expect(modify_player).to eq(1) }
    end

    context "personagem forte" do
      def modify_player
        player.character = {name: "mateus", hit_value: 5, image: "imagem.png"}
        player.push_hadouken
      end
      it { expect(modify_player).to eq(5) }
    end

    context "personagem fraco" do
      def modify_player
        player.character = {name: "julian", hit_value: false, image: "imagem.png"}
        player.push_hadouken
      end
      it { expect(modify_player).to eq(false) }
    end
  end

end
