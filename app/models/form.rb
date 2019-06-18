class Form < ApplicationRecord
  belongs_to :user
  has_many :check_lists
end
