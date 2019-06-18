class CheckList < ApplicationRecord
  belongs_to :form
  has_many :questions
end
