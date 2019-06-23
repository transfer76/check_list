class Form < ApplicationRecord
  belongs_to :user
  has_many :form_questions, dependent: :destroy
  has_many :check_lists, dependent: :destroy

  validates :title, presence: true
  validates :title, :description, length: { minimum: 2 }
end
