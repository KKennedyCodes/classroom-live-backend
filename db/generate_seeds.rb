require "faker"
require "date"
require "csv"

# run using the command:
# $ ruby db/generate_seeds.rb
# recreate the db with:
# $ rails db:reset

# Users (50)
CSV.open("db/seed_data/users.csv", "w", :write_headers => true, :headers => ["first_name", "last_name", "pronouns", "email" ]) do |csv|
  50.times do
    first_name = Faker::Name.first_name
    last_name = Faker::Name.last_name
    pronouns = ["she/hers", "he/his", "they/theirs"].sample
    email = Faker::Internet.email
    csv << [first_name, last_name, pronouns, email] 
  end
end

# Courses (10)
CSV.open("db/seed_data/courses.csv", "w", :write_headers => true, :headers => ["title", "section", "code", "user_id"]) do |csv|
  10.times do
    title = Faker::Educator.unique.course_name
    section = ["Period 1", "Period 2", "Period 3", "Period 4", "Period 5"].sample
    code = Faker::Alphanumeric.unique.alphanumeric(number: 8)
    user_id = rand(1..50)
    csv << [title, section, code, user_id]
  end
end

# Sessions (50)
CSV.open("db/seed_data/sessions.csv", "w", :write_headers => true, :headers => ["task", "task_objective", "start", "end", "status", "course_id"]) do |csv|
  50.times do 
    task = Faker::DcComics.title
    task_objective = Faker::GreekPhilosophers.quote
    session_start = rand(Date.today - 500..Date.today)
    session_end = (session_start + 1)
    status = "complete"
    course_id = rand(1..10)
    csv << [task, task_objective, session_start, session_end, status, course_id]
  end
end

# Questions (50)
CSV.open("db/seed_data/questions.csv", "w", :write_headers => true, :headers => ["question_text", "visible", "answered", "user_id", "session_id"]) do |csv|
  50.times do 
    question_text = Faker::Hipster.sentence
    visible = [true, true, true, false].sample
    answered = nil
    user_id = rand(1..50)
    session_id = rand(1..50)
    csv << [question_text, visible, answered, user_id, session_id]
  end
end

# Answers (30)
CSV.open("db/seed_data/answers.csv", "w", :write_headers => true, :headers => ["answer_text", "user_id", "question_id"]) do |csv|
  30.times do
    answer_text = Faker::Quote.yoda
    question_id = rand(1..50)
    user_id = rand(1..50)
    
    csv << [answer_text, question_id, user_id]
  end
end

# Statuses (200)
CSV.open("db/seed_data/statuses.csv", "w", :write_headers => true, :headers => ["status_start", "status_end", "student_comment", "teacher_comment", "session_id", "user_id", "code_id"]) do |csv|
  200.times do 
    status_start = rand(Date.today - 500..Date.today)
    status_end = (status_start + 1)
    student_comment = Faker::TvShows::Friends.quote
    teacher_comment = Faker::TvShows::MichaelScott.quote
    session_id = rand(1..50)
    user_id = rand(1..50)
    code_id = rand(1..5)
    csv << [status_start, status_end, student_comment, teacher_comment, session_id, user_id, code_id]
  end
end

