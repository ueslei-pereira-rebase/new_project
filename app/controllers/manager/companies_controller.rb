module Manager
  class CompaniesController < ManagerController

    def new
      @company = Company.new
    end

    def create
      company = Manager::CreateCompanyService.new(params_permitted).execute

      if company.success?
        redirect_to new_manager_company_path, notice: company.context
      else
        redirect_to new_manager_company_path, alert: company.context
      end
    end

    private

    def params_permitted
      params.require(:company).permit(:name, :cnpj, :address, :email).to_h
    end
  end
end