# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
more_subjects = [
    {:course_name => '102',
      :course_section => 'A'},
    {:course_name => '102',
      :course_section => 'B'},
    {:course_name => '202',
        :course_section => 'C'}
  ]

  seed_admin = [
    {:name => "admin", :email_id => "admin@email.com", :access_level => "admin", :password => "admin1234", :password_confirmation => "admin1234"}
  ]

  seed_students = [
    {:name => "Opeyemi", :email_id => "opeyemi@email.com", :access_level => "TA", :password => "opeyemi1234", :password_confirmation => "opeyemi1234"},
    {:name => "Jake", :email_id => "jake@email.com", :access_level => "TA", :password => "jake1234", :password_confirmation => "jake1234"},
    {:name => "Alex", :email_id => "alex@email.com", :access_level => "TA", :password => "alex1234", :password_confirmation => "alex1234"},
    {:name => "Vic", :email_id => "vic@email.com", :access_level => "TA", :password => "vic1234", :password_confirmation => "vic1234"},
    {:name => "Ryan", :email_id => "ryan@email.com", :access_level => "TA", :password => "ryan1234", :password_confirmation => "ryan1234"},
    {:name => "Astu", :email_id => "astu@email.com", :access_level => "TA", :password => "astu1234", :password_confirmation => "astu1234"},
    {:name => "Leed", :email_id => "leed@email.com", :access_level => "TA", :password => "leed1234", :password_confirmation => "leed1234"},
    {:name => "Maria", :email_id => "maria@email.com", :access_level => "TA", :password => "maria1234", :password_confirmation => "maria1234"},
    {:name => "Melissa", :email_id => "melissa@email.com", :access_level => "TA", :password => "melissa1234", :password_confirmation => "melissa1234"},
    {:name => "Jakob", :email_id => "jakob@email.com", :access_level => "TA", :password => "jakob1234", :password_confirmation => "jakob1234"},
    {:name => "Abigail", :email_id => "abigail@email.com", :access_level => "TA", :password => "abigail1234", :password_confirmation => "abigail1234"},
    {:name => "Malory", :email_id => "malory@email.com", :access_level => "TA", :password => "malory1234", :password_confirmation => "malory1234"},
    {:name => "Kate", :email_id => "kate@email.com", :access_level => "TA", :password => "kate1234", :password_confirmation => "kate1234"},
    {:name => "Sarah", :email_id => "sarah@email.com", :access_level => "TA", :password => "sarah1234", :password_confirmation => "sarah1234"},
    {:name => "Cassy", :email_id => "cassy@email.com", :access_level => "TA", :password => "cassy1234", :password_confirmation => "cassy1234"},
    {:name => "Cassidy", :email_id => "cassidy@email.com", :access_level => "TA", :password => "cassidy1234", :password_confirmation => "cassidy1234"},
    {:name => "Megan", :email_id => "megan@email.com", :access_level => "TA", :password => "megan1234", :password_confirmation => "megan1234"},
    {:name => "Chase", :email_id => "chase@email.com", :access_level => "TA", :password => "chase1234", :password_confirmation => "chase1234"},
    {:name => "Graeme", :email_id => "graeme@email.com", :access_level => "TA", :password => "graeme1234", :password_confirmation => "graeme1234"},
    {:name => "Hailey", :email_id => "hailey@email.com", :access_level => "TA", :password => "hailey1234", :password_confirmation => "hailey1234"}   
  ]

  seed_professors = [
    {:name => "Wherley", :email_id => "wherley@email.com", :access_level => "Professor", :password => "wherley1234", :password_confirmation => "wherley1234"},
    {:name => "Straw", :email_id => "straw@email.com", :access_level => "Professor", :password => "straw1234", :password_confirmation => "straw1234"},
    {:name => "Floyd", :email_id => "floyd@email.com", :access_level => "Professor", :password => "floyd1234", :password_confirmation => "floyd1234"},
    {:name => "Ritchey", :email_id => "ritchey@email.com", :access_level => "Professor", :password => "ritchey1234", :password_confirmation => "ritchey1234"},
    {:name => "Janute", :email_id => "janute@email.com", :access_level => "Professor", :password => "janute1234", :password_confirmation => "janute1234"}
  ]
  
  more_subjects.each do |subject|
    Subject.create!(subject)
  end

  seed_admin.each do |admin|
    User.create!(admin)
  end

  seed_students.each do |student|
    User.create!(student)
  end
  seed_professors.each do |professor|
    User.create!(professor)
  end
