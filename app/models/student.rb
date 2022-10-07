class Student < ActiveRecord::Base
  include ActiveModel::Model

  validates :name, :email_id, :contact, presence: true
  attr_accessor :name, :email_id, :contact, :employment_status, :is_undergrad, :courses_completed
end
