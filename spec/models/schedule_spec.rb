require 'rails_helper'

RSpec.describe Schedule, type: :model do
  context "when uploading a schedule" do
    it "creates a new schedule" do
      schedule = Schedule.new(code: "ENGR", course_id: 102, section: 201, lecture_day: "Thursday", start_time: "9:35 AM", end_time: "10:25 AM", professor: "Janute", students: ["test1@email.com", "test2@email.com"])
      expect(schedule.save).to be true
    end
  end

  context "when viewing a schedule" do
    it "displays the correct schedule" do
      schedule = Schedule.create(code: "ENGR", course_id: 102, section: 201, lecture_day: "Thursday", start_time: "9:35 AM", end_time: "10:25 AM", professor: "Janute", students: ["test1@email.com", "test2@email.com"])
      expect(Schedule.find_by(code: "ENGR", section: 201)).to eq(schedule)
    end

    it "fails to display a non-existent schedule" do
      expect(Schedule.find_by(code: "ENGR", section: 201)).to be nil
    end
  end

  context "when removing a schedule" do
    it "removes an existing schedule" do
      schedule = Schedule.create(code: "ENGR", course_id: 102, section: 201, lecture_day: "Thursday", start_time: "9:35 AM", end_time: "10:25 AM", professor: "Janute", students: ["test1@email.com", "test2@email.com"])
      schedule.destroy
      expect(Schedule.find_by(code: "ENGR", section: 201)).to be nil
    end

    it "fails to remove a non-existent schedule" do
      expect { Schedule.find_by(code: "Non existent", section: "201").destroy }.to raise_error(NoMethodError)
    end
  end
end
