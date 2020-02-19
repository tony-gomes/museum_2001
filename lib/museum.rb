class Museum
  attr_reader :name, :exhibits

  def initialize(name)
    @name = name
    @exhibits = []
  end

  def add_exhibit(exhibit)
    @exhibits << exhibit
  end

  def recommend_exhibits(patron)
    recommendation = []

    @exhibits.each do |exhibit|
      recommendation.unshift(exhibit) if patron.interests.any?(exhibit.name)
    end
    recommendation
  end
end
