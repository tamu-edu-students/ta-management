FactoryBot.define do
  factory :user do
    id { 1 }
    name { 'John' }
    email_id { 'anc@gmail.com' }
    password { 'password' }
    password_confirmation { 'password' }
    access_level { 'TA' }
  end
end