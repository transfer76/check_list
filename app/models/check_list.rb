class CheckList < ApplicationRecord
  belongs_to :form
  belongs_to :user

  has_many :answers, dependent: :destroy

  validates :project_uid, presence: true
  validate :form_is_published

  delegate :title, :description, to: :form

  before_create :initialize_answers

  accepts_nested_attributes_for :answers

  private

  def initialize_answers
    form.form_questions.each do |question|
      answers << Answer.new(form_question: question, user: user)
    end
  end

  def form_is_published
    return unless form

    unless form.published?
      errors.add(:form, 'Must be published')
    end
  end
end
