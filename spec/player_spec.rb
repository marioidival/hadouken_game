require 'spec_helper'

describe Player do

  let(:player) { Player.new }

  describe "#escolhendo personagem" do
    context "#character deve ser um array" do
      it { expect(player.character).to be_a(Array) }
    end
  end

  describe "#push_hadouken" do
    context "#personagem comum" do
      it { expect(player.push_hadouken).to eq(1) }
    end

    context "#personagem alterado" do
      xit { expect(player.push_hadouken).to eq(5) }
    end
  end

end
