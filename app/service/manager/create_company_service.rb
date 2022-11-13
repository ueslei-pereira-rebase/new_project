module Manager
  class CreateCompanyService
    attr_reader :params

    def initialize(params)
      @params = params
    end

    def execute
      company = Company.find_by(cnpj: params[:cnpj])

      if company
        build_result(success: false, context: "Empresa já cadastrada")
      else
        Company.create!(params)
        build_result(success: true, context: "Empresa cadastrada")
      end

    rescue StandardError => e
      build_result(success: false, context: e.message)
    end

    private

    def build_result(success:, context:)
      OpenStruct.new(
        success?: success,
        context: context
      )
    end
  end
end