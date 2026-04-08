module Reports
  class CovidRepository
    def initialize(model = Report)
      @model = model
    end

    def find_all
      @model.all
    end

    def create(attrs)
      @model.create!(attrs)
    end
  end
end
