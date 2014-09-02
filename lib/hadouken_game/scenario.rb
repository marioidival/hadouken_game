class Scenario
  attr_reader :scenario

  def initialize
    @scenario = random_background
  end

  def random_background
    # Retorna um cenario aleatorio
    scenarios = [
      'hadouken_game/media/scenarios/1.png',
      'hadouken_game/media/scenarios/2.png',
      'hadouken_game/media/scenarios/3.png',
      'hadouken_game/media/scenarios/4.png',
      'hadouken_game/media/scenarios/5.png',
      'hadouken_game/media/scenarios/6.png',
      'hadouken_game/media/scenarios/7.png',
      'hadouken_game/media/scenarios/8.png',
      'hadouken_game/media/scenarios/9.png',
      'hadouken_game/media/scenarios/10.png',
      'hadouken_game/media/scenarios/11.png',
      'hadouken_game/media/scenarios/12.png',
    ]

    scenarios[rand(scenarios.size)]
  end
end
