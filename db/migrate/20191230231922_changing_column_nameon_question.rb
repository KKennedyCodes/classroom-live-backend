class ChangingColumnNameonQuestion < ActiveRecord::Migration[5.2]
  def change
    rename_column :questions, :question, :question_text
    rename_column :answers, :response, :answer_text
  end
end
