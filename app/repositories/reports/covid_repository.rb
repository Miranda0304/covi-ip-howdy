module Reports
  class CovidRepository
    def initialize(model = Report)
      @model = model
    end 

    def find_all
      @model.all
    end
  end
end
