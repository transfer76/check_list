class CheckList < ApplicationRecord
  belongs_to :form
  belongs_to :user

  has_many :answers

  validates :project_uid, presence: true
end
