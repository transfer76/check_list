class User < ApplicationRecord
  rolify
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :forms, dependent: :destroy
  has_many :check_lists, dependent: :destroy

  def admin?
    has_role?(:admin)
  end
end
