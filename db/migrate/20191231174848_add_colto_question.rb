class AddColtoQuestion < ActiveRecord::Migration[5.2]
  def change
    add_reference :questions, :session, foreign_key: true
  end
end
