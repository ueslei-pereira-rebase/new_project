require 'csv'
module Account
  class ProductsController < ApplicationController
    before_action :authenticate_user!

    def index
      @list_product = Product.where(user_id: current_user)
        .order(created_at: :desc)
        .page(params[:page])
        .per(5)
      @advertise_products = @list_product.map do |product|
        ProductPresenter.new(product, current_user)
      end
    end

    def new
      @product = Product.new
    end

    def create
      Advertise::CreateProductService.new(params_permitted, current_user).execute
      redirect_to account_products_path
    end

    def edit
      @advertise_products = Product.find(params[:id])
      #terminar
    end


    def desactive
      advertise = current_user.products.find(params[:id])
      advertise.desactive!

      redirect_to account_products_path(page: params[:page])
    end

    def active
      advertise = current_user.products.find(params[:id])
      advertise.active!

      redirect_to account_products_path(page: params[:page])
    end

    def wish_list
      @products = current_user.participate_list
      .order(created_at: :desc)
      .page(params[:page])
      .per(4)

      @advertise_products = @products.map do |product|
        ProductPresenter.new(product, current_user)
      end
    end
    
    private

    def params_permitted
      params.require(:product).permit(:amount, :price, :title, :body, images: [])
      # params[:product][:images] = params[:product][:image1], params[:product][:image2]
      # params[:product].delete(:image1)
      # params[:product].delete(:image2)
      # params[:product].delete(:authenticity_token)
      # params
    end
  end
end