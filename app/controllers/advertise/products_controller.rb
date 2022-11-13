module Advertise
  class ProductsController < ApplicationController

    before_action :authenticate_user!

    def show
      adv = Product.find(params[:id])
      @product = ProductPresenter.new(adv, current_user)
    rescue ActiveRecord::RecordNotFound
      redirect_to account_products_path, flash[:alert] = "Houve um erro, produto nao encontrado"
    end

    def join
      product = Product.find(params[:id])
      Advertise::JoinListProductService.new(product, current_user).execute
      redirect_to advertise_product_path(product)
    end

    def leave
      product = Product.find(params[:id])
      Advertise::LeaveListProductService.new(product, current_user).execute
      redirect_to advertise_product_path(product)
    end
  end
end