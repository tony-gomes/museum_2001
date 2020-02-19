class Museum
  attr_reader :name, :exhibits, :patrons

  def initialize(name)
    @name = name
    @exhibits = []
    @patrons = []
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

  def admit(patron)
    @patrons << patron
  end

  def patrons_by_exhibit_interest
    interested_patrons = {}

    exhibits.each { |exhibit| interested_patrons[exhibit] = [] }

    patrons.each do |patron|
      interests = recommend_exhibits(patron)
      interests.each {|exhibit| interested_patrons[exhibit] << patron}
    end
    interested_patrons
  end
end
