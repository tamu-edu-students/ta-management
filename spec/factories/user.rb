FactoryBot.define do
  factory :user do
    id { 1 }
    name { 'John' }
    email_id { 'anc@gmail.com' }
    password { 'password' }
    confirm_password { 'password' }
    access_level { 'professor' }
  end
end