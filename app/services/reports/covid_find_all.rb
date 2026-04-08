module Reports
  class CovidFindAll
    def initialize(repository: Reports::CovidRepository.new)
      @scope = repository
    end

    def call
      @scope = @scope.find_all
    end
  end
end
