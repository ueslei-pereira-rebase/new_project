module Account
  class HomeController < AccountController
    
    def index
      company_id = current_user.company_id
      @products = Company.products_active(company_id)
      .order(filter(params))
      .page(params[:page])
      .per(12)
    end

    def search
      company = current_user.company_id
      query = params[:query]

      @products = Company.search(query.downcase, company)
      .order(created_at: :desc)
      .page(params[:page])
      .per(4)

      @ads = @products.map do |product|
        ProductPresenter.new(product, current_user)
      end

      @keyword = query
    end

    private

    def filter(params)
      case params.keys.first
      when "order"
        return {created_at: params[:order]}
      when "price"
        return {price: params[:price]}
      else
        return {created_at: "desc"}
      end
    end
  end
end