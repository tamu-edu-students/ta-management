FactoryBot.define do
  factory :schedule do
    id { 1 }
    code { 'ENGR' }
    course_id  { 102 }
    section { 201 }
    lecture_day  { 'Thursday' }
    start_time { '9:35 AM' }
    end_time  { '10:25 AM' }
    professor { 'Janute' }
    students  { ["test1@email.com", "test2@email.com"] }
  end
end