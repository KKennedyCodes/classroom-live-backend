class CreateSessions < ActiveRecord::Migration[5.2]
  def change
    create_table :sessions do |t|
      t.string :task
      t.string :task_objective
      t.datetime :start
      t.datetime :end
      t.string :status

      t.timestamps
    end
    add_reference :sessions, :course, foreign_key: true
  end
end
