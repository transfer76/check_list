class CheckList < ApplicationRecord
  belongs_to :form
  belongs_to :user

  has_many :answers, dependent: :destroy

  validates :project_uid, presence: true

  delegate :title, :description, to: :form

  before_create :initialize_answers

  accepts_nested_attributes_for :answers

  def publish!
    update!(published: true, published_at: Time.now)
  end

  private

  def initialize_answers
    form.form_questions.each do |question|
      answers << Answer.new(form_question: question, user: user)
    end
  end
end
