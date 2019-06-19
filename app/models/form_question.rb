class FormQuestion < ApplicationRecord
  belongs_to :form
  has_many :answers

  validates :title, presence: true
  validates :title, :description, length: { minimum: 2 }
end
