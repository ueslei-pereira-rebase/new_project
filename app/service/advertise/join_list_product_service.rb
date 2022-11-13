module Advertise
  class JoinListProductService
    attr_reader :product, :user
    
    def initialize(product, user)
      @product = product
      @user = user
    end

    def execute
      return  build_result(success: false, context: 'Esta lista não aceita mais participantes') if full_list?
      accept_join
      check_if_inactive_adv
      build_result(success: false, context: 'Voce esta na lista')
    end

    private

    def full_list?
      total_list = product.amount
      participate_list = product.joins.count
      total_list == participate_list
    end

    def accept_join
      ActiveRecord::Base.transaction do
        Agree.create(product: product, user: user)
        product.increment!(:interested_amount)
      end
    end

    def check_if_inactive_adv
      product.desactive! if (product.interested_amount == product.amount)
    end

    def build_result(success: nil, context: nil)
      OpenStruct.new(
        success?: success,
        context: context
      )
    end

  end
end