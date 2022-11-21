module Advertise
  class EditProductService
    attr_reader :params, :product
    
    def initialize(params, product)
      @params = params
      @product = product
    end

    def execute

      ActiveRecord::Base.transaction do
        product.update(params)
        #terminar
      end
    end

  end
end