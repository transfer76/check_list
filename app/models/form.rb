class Form < ApplicationRecord
  belongs_to :user
  has_many :form_questions
  has_many :check_lists

  validates :title, presence: true
  validates :title, :description, length: { minimum: 2 }
end
