# README
TA-MANAGEMENT

The app handles the student applications for TA positions in computer science department.
* The student applies using an application form.
* The hiring manager/ coordinator shortlist the candidates and hold interviews accordingly.
Once the candidates are selected, they are assigned the subjects by the coordinator according to
the decided schedule.
* The professors can view the TA assigned under them.

Setup Instructions:

* Ruby version
  
  2.7.6
* System dependencies 
  
  postgres
* Configuration

* Database console 

  rails dbconsole 

* Create table

  rails generate scaffold RubyWinSource name:string \
  author:string url:string
* DB Migration 
 
  rake db:migrate
  rake db:migrate VERSION=timestamp

* Database initialization
  
  brew services start postgres

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

  App gets automatically deployed to Heroku when merging to main

* Heroku Instructions
  
  heroku stack --app ta-management-tamu
  heroku stack:set heroku-20 --app ta-management-tamu
  Might need to migrate in Heroku as well, that can be done using migrate command in the heroku console
* Rspec

  To run a Rspec
  rspec spec/controllers/students_spec.rb
  Factory Bot Documentation
  https://github.com/thoughtbot/factory_bot/blob/master/GETTING_STARTED.md#rspec