class CreateAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :answers do |t|
      t.string :response
      
      t.timestamps
    end
    add_reference :answers, :user, foreign_key: true
    add_reference :answers, :question, foreign_key: true
  end
end
