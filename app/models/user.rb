class User < ApplicationRecord
  has_many :agrees
  has_many :participate_list, through: :agrees, source: :product
  has_many :products
  belongs_to :company
  has_one_attached :avatar
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  before_validation :get_company
  validates_acceptance_of :agree, allow_nil: false, on: :create
  after_create :attach_avatar

  enum status: { inactive: 0 , active: 1 }
  enum gender: { female: 0, male: 1 }

    private

    def attach_avatar
      self.avatar.attach(io: File.open("app/assets/images/#{self.gender}.jpg"), filename: "profile.jpg")
    end
    
    def get_company
      domain_name = email.split("@")[1].split('.')[0]
      company = Company.find_by(domain: domain_name)
      if company.present?
        self.company = company
      else
        errors.add(:email, "empresa não está registrada")
      end
    end

end