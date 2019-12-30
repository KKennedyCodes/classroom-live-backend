class CreateStatuses < ActiveRecord::Migration[5.2]
  def change
    create_table :statuses do |t|
      t.datetime :start
      t.datetime :end
      t.string :student_comment
      t.string :teacher_comment

      t.timestamps
    end
    add_reference :statuses, :user, foreign_key: true
    add_reference :statuses, :session, foreign_key: true
  end
end
