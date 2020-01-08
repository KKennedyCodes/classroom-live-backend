# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'
created_users = []
created_courses = []
created_sessions = []
created_questions = []
created_answers = []
created_codes = []

USERS_FILE = Rails.root.join('db', "seed_data", 'users.csv')
puts "Loading raw users data from #{USERS_FILE}"

user_failures = []

CSV.foreach(USERS_FILE, :headers => true) do |row|
  user = User.new
  user.first_name = row["first_name"]
  user.last_name = row["last_name"]
  user.pronouns = row["pronouns"]
  user.email = row["email"]
  
  successful = user.save
  created_users << user
  
  if !successful
    user_failures << user
    puts "Failed to save user: #{user.inspect}"
  else
    # puts "Created merchant: #{merchant.inspect}"
  end
end

puts "Added #{User.count} user records"
puts "#{user_failures.length} users failed to save"


COURSES_FILE = Rails.root.join('db', "seed_data", 'courses.csv')
puts "Loading raw users data from #{COURSES_FILE}"

course_failures = []

CSV.foreach(COURSES_FILE, :headers => true) do |row|
  course = Course.new
  course.title = row["title"]
  course.section = row["section"]
  course.code = row["code"]
  course.user_id = rand(1..2)
  
  successful = course.save
  created_courses << course
  if !successful
    course_failures << course
    puts "Failed to save course: #{course.inspect}"
  else
    # puts "Created merchant: #{merchant.inspect}"
  end
end

puts "Added #{Course.count} course records"
puts "#{course_failures.length} course failed to save"

SESSIONS_FILE = Rails.root.join('db', "seed_data", 'sessions.csv')
puts "Loading raw session data from #{SESSIONS_FILE}"

session_failures = []

CSV.foreach(SESSIONS_FILE, :headers => true) do |row|
  session = Session.new
  session.task = row["task"]
  session.task_objective = row["task_objective"]
  session.session_start = row["session_start"]
  session.session_end = row["session_end"]
  session.status = row["status"]
  session.course_id = row["course_id"]
  successful = session.save
  created_sessions << session
  
  if !successful
    session_failures << session
    puts "Failed to save session: #{session.inspect}"
  else
    # puts "Created merchant: #{merchant.inspect}"
  end
end

puts "Added #{Session.count} session records"
puts "#{session_failures.length} session failed to save"


QUESTIONS_FILE = Rails.root.join('db', "seed_data", 'questions.csv')
puts "Loading raw question data from #{QUESTIONS_FILE}"

question_failures = []

CSV.foreach(QUESTIONS_FILE, :headers => true) do |row|
  question = Question.new
  question.question_text = row["question_text"]
  question.visible = row["visible"]
  question.answered = row["answered"]
  question.user_id = (created_users.sample).id
  question.session_id = (created_sessions.sample).id
  
  successful = question.save
  created_questions << question
  
  if !successful
    question_failures << question
    puts "Failed to save question: #{question.inspect}"
  else
    # puts "Created merchant: #{merchant.inspect}"
  end
end

puts "Added #{Question.count} question records"
puts "#{question_failures.length} question failed to save"

ANSWERS_FILE = Rails.root.join('db', "seed_data", 'answers.csv')
puts "Loading raw answer data from #{ANSWERS_FILE}"

answer_failures = []

CSV.foreach(ANSWERS_FILE, :headers => true) do |row|
  answer = Answer.new
  answer.answer_text = row["answer_text"]
  answer.user_id = (created_users.sample).id
  answer.question_id = (created_questions.sample).id
  
  successful = answer.save
  created_answers << answer
  
  if !successful
    answer_failures << answer
    puts "Failed to save answer: #{answer.inspect}"
  else
    # puts "Created merchant: #{merchant.inspect}"
  end
end

puts "Added #{Answer.count} answer records"
puts "#{answer_failures.length} answer failed to save"


CODES_FILE = Rails.root.join('db', "seed_data", 'codes.csv')
puts "Loading raw answer data from #{CODES_FILE}"

code_failures = []

CSV.foreach(CODES_FILE, :headers => true) do |row|
  code = Code.new
  code.color = row["color"]
  code.description = row["description"]
  
  successful = code.save
  created_codes << code
  
  if !successful
    code_failures << code
    puts "Failed to save code: #{code.inspect}"
  else
    # puts "Created merchant: #{merchant.inspect}"
  end
end

puts "Added #{Code.count} status code records"
puts "#{code_failures.length} status codes failed to save"


STATUSES_FILE = Rails.root.join('db', "seed_data", 'statuses.csv')
puts "Loading raw status data from #{STATUSES_FILE}"

status_failures = []

CSV.foreach(STATUSES_FILE, :headers => true) do |row|
  status = Status.new
  status.status_start = row["status_start"]
  status.status_end = row["status_end"]
  status.student_comment = row["student_comment"]
  status.teacher_comment = row["teacher_comment"]
  status.session_id = (created_sessions.sample).id
  status.user_id = (created_users.sample).id
  status.code_id = (created_codes.sample).id
  successful = status.save
  
  if !successful
    status_failures << status
    puts "Failed to save status: #{status.inspect}"
  else
    # puts "Created merchant: #{merchant.inspect}"
  end
end

puts "Added #{Session.count} status records"
puts "#{status_failures.length} status failed to save"