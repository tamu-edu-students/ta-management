class Subject < ApplicationRecord
  validates :course_name, uniqueness: { scope: :course_section }
end