class User < ApplicationRecord
  has_many :forms
  has_many :lists
end
