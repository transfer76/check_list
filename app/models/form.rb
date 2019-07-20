class Form < ApplicationRecord
  belongs_to :user
  has_many :form_questions, dependent: :destroy
  has_many :check_lists, -> { order(:created_at) }, dependent: :destroy

  validates :title, presence: true
  validates :title, :description, length: { minimum: 2 }

  accepts_nested_attributes_for :form_questions

  scope :published, -> { where('published') }

  def publish!
    update!(published: true, published_at: Time.now)
  end
end
