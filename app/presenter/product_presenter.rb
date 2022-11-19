class ProductPresenter < SimpleDelegator
  attr_reader :product, :user

  def initialize(product, user)
    @product = product
    @user = user
    super(product)
  end

  def title
    product.title.capitalize
  end

  def showcase
    product.images.first.representation(resize_to_limit: [328, 298])
  end

  def image?
    product.images.attached?
  end

  def description
    product.body.capitalize
  end

  def price
    product.price
  end

  def owner
    "Anunciante: #{product.user.name}"
  end

  def interests
    "#{product.interested_amount}/#{product.amount}"
  end

  def owner?
    product.user == user
  end

  def complete_list?
    product.amount
  end

  def already_join?
    product.joins.exists?(user.id)
  end

  def handshack
    already_join? ? 'joined' : 'join'
  end

  def progress
    ((product.interested_amount.to_f / product.amount)*100).ceil
  end

end