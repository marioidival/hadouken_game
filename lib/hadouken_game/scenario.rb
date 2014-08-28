class Scenario
  attr_reader :scenario
  def initialize
    @scenario = random_background
  end

  def random_background
    # Retorna um cenario aleatorio
    scenarios = [
      'hadouken_game/media/scenarios/hienstage.jpg',
      'hadouken_game/media/scenarios/island.png',
      'hadouken_game/media/scenarios/1166.gif',
    ]

    scenarios[rand(scenarios.size)]
  end
end
