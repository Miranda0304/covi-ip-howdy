module Reports
  class CovidCreate
    def initialize(repository: Reports::CovidRepository.new)
      @repository = repository
    end

    def call(params)
      @repository.create(params)
    end
  end
end
