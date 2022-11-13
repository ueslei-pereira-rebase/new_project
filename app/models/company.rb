class Company < ApplicationRecord
  has_many :users, dependent: :destroy
  has_many :products, dependent: :destroy

  validates :name, presence: true
  validates :cnpj, presence: true
  validates :address, presence: true
  validates :email, presence: true
  # validates :company_id, presence: true

  before_create :name_domain

  scope :products_active, ->(company) { find(company).products.active }
  scope :search, ->(query, company) do 
    if query.present?
      find(company).products.where('LOWER(title) like ? OR LOWER(body) like ?', 
                                      "%#{query}%", "%#{query}%").active
    else 
      find(company).products.all
    end
  end


  # def is_employee?(email)
  #   return true if Employee.find_by(email: email)
  #   false
  # end

  private

  def name_domain
    self.domain = email.split('@')[1].split('.')[0]
  end
end