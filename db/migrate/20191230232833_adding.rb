class Adding < ActiveRecord::Migration[5.2]
  def change
    add_reference :statuses, :status_code, foreign_key: true
  end
end
