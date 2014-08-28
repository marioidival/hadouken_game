class Scenario
  attr_writer :random_background
  def initialize
    @scenario = random_background
  end

  def random_background
    # Retorna um cenario aleatorio
    scenarios = [
      '/media/scenario/image.png',
      '/media/scenario/image.png',
      '/media/scenario/image.png',
      '/media/scenario/image.png',
    ]

    scenarios[rand(scenarios.size)]
  end
end
