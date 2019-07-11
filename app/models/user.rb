class User < ApplicationRecord
  rolify
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :forms, dependent: :destroy
  has_many :check_lists, dependent: :destroy

  def admin?
    has_role?(:admin)
  end

  # test admin for production

  # def admin
  #   admin?
  # end

  # def admin=(value)
  #   add_role(:admin) if value && value == '1'
  # end
end
