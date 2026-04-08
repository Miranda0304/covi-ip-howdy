module Reports
  class CovidFindAll
    def initialize(repository: Reports::CovidRepository.new)
      @scope = repository
    end

    def call(params)
      @scope = @scope.find_all
      @scope = filter_by_date_from(params[:date_from])
      @scope = filter_by_date_to(params[:date_to])
      @scope = filter_by_age_from(params[:age_from])
      @scope = filter_by_age_to(params[:age_to])
      @scope = filter_by_gender(params[:gender])
      @scope = default_order
    end

    def filter_by_date_from(date_from)
      return @scope unless date_from.present?
      @scope.where("date >= ?", date_from)
    end

    def filter_by_date_to(date_to)
      return @scope unless date_to.present?
      @scope.where("date <= ?", date_to)
    end

    def filter_by_age_from(age_from)
      return @scope unless age_from.present?
      @scope.where("age >= ?", age_from)
    end

    def filter_by_age_to(age_to)
      return @scope unless age_to.present?
      @scope.where("age <= ?", age_to)
    end

    def filter_by_gender(gender)
      return @scope unless gender.present?
      @scope.where(gender: gender)
    end

    def default_order
      @scope.order(id: :asc)
    end
  end
end
