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
  
  more_subjects.each do |subject|
    Subject.create!(subject)
  end
