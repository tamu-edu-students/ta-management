FactoryBot.define do
  factory :student do
    id { 1 }
    uin  { '123456789' }
    resume {"www.google.com"}
    transcript {"www.google.com"}
    # email_id { 'anc@gmail.com' }

  end
end


# params.require(:student).permit(:is_undergrad, :courses_completed, :resume, :transcript, :access_level, :application_status, :comments, :assigned_courses, :assigned_sections, :rating, :feedback, :sections, :user_id)