class CheckList < ApplicationRecord
  belongs_to :form
  belongs_to :user

  has_many :answers

  validates :project_uid, presence: true

  delegate :title, :form_questions, :description, to: :form
end
