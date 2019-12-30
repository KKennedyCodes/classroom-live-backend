class CreateCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :courses do |t|
      t.string :title
      t.string :section
      t.string :code
      t.timestamps
    end
    add_reference :courses, :user, foreign_key: true
  end
end
