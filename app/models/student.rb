class Student < ApplicationRecord
  validates :name, :email_id, :contact, presence: true
end
