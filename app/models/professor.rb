class Professor < ApplicationRecord
  :attr_accessor
  belongs_to :user
  has_many :assignments, dependent: :destroy
  # has_many :subjects
  # has_many :students
end
