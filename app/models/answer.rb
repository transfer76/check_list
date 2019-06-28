class Answer < ApplicationRecord
  enum response: [:absent, :yes, :no, :na]

  belongs_to :check_list
  belongs_to :form_question
  belongs_to :user

  validates :response, presence: true
  validates :comment, length: { minimum: 12 }

  validate :check_form_question_id

  delegate :title, :description, to: :form_question

  private

  def check_form_question_id
    if form_question.form_id != check_list.form_id
      errors.add(:form_question_id, :invalid)
    end
  end
end
