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
    {:name => "admin", :email_id => "admin@email.com", :access_level => "admin", :password => "admin", :password_confirmation => "admin"}
  ]

  seed_students = [
    {:name => "Opeyemi", :email_id => "opeyemi@email.com", :access_level => "TA", :password => "opeyemi", :password_confirmation => "opeyemi"},
    {:name => "Jake", :email_id => "jake@email.com", :access_level => "TA", :password => "jake", :password_confirmation => "jake"},
    {:name => "Alex", :email_id => "alex@email.com", :access_level => "TA", :password => "alex", :password_confirmation => "alex"},
    {:name => "Vic", :email_id => "vic@email.com", :access_level => "TA", :password => "vic", :password_confirmation => "vic"},
    {:name => "Ryan", :email_id => "ryan@email.com", :access_level => "TA", :password => "ryan", :password_confirmation => "ryan"},
    {:name => "Astu", :email_id => "astu@email.com", :access_level => "TA", :password => "astu", :password_confirmation => "astu"},
    {:name => "Leed", :email_id => "leed@email.com", :access_level => "TA", :password => "leed", :password_confirmation => "leed"},
    {:name => "Maria", :email_id => "maria@email.com", :access_level => "TA", :password => "maria", :password_confirmation => "maria"},
    {:name => "Melissa", :email_id => "melissa@email.com", :access_level => "TA", :password => "melissa", :password_confirmation => "melissa"},
    {:name => "Jakob", :email_id => "jakob@email.com", :access_level => "TA", :password => "jakob", :password_confirmation => "jakob"},
    {:name => "Abigail", :email_id => "abigail@email.com", :access_level => "TA", :password => "abigail", :password_confirmation => "abigail"},
    {:name => "Malory", :email_id => "malory@email.com", :access_level => "TA", :password => "malory", :password_confirmation => "malory"},
    {:name => "Kate", :email_id => "kate@email.com", :access_level => "TA", :password => "kate", :password_confirmation => "kate"},
    {:name => "Sarah", :email_id => "sarah@email.com", :access_level => "TA", :password => "sarah", :password_confirmation => "sarah"},
    {:name => "Cassy", :email_id => "cassy@email.com", :access_level => "TA", :password => "cassy", :password_confirmation => "cassy"},
    {:name => "Cassidy", :email_id => "cassidy@email.com", :access_level => "TA", :password => "cassidy", :password_confirmation => "cassidy"},
    {:name => "Megan", :email_id => "megan@email.com", :access_level => "TA", :password => "megan", :password_confirmation => "megan"},
    {:name => "Chase", :email_id => "chase@email.com", :access_level => "TA", :password => "chase", :password_confirmation => "chase"},
    {:name => "Graeme", :email_id => "graeme@email.com", :access_level => "TA", :password => "graeme", :password_confirmation => "graeme"},
    {:name => "Hailey", :email_id => "hailey@email.com", :access_level => "TA", :password => "hailey", :password_confirmation => "hailey"}   
  ]

  seed_professors = [
    {:name => "Wherley", :email_id => "wherley@email.com", :access_level => "Professor", :password => "wherley", :password_confirmation => "wherley"},
    {:name => "Straw", :email_id => "straw@email.com", :access_level => "Professor", :password => "straw", :password_confirmation => "straw"},
    {:name => "Floyd", :email_id => "floyd@email.com", :access_level => "Professor", :password => "floyd", :password_confirmation => "floyd"},
    {:name => "Ritchey", :email_id => "ritchey@email.com", :access_level => "Professor", :password => "ritchey", :password_confirmation => "ritchey"},
    {:name => "Janute", :email_id => "janute@email.com", :access_level => "Professor", :password => "janute", :password_confirmation => "janute"}
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
