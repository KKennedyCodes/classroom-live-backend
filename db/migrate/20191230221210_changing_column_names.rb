class ChangingColumnNames < ActiveRecord::Migration[5.2]
  def change
    rename_column :sessions, :start, :session_start
    rename_column :sessions, :end, :session_end
    rename_column :statuses, :start, :status_start
    rename_column :statuses, :end, :status_end
    rename_column :questions, :public, :visible
  end
end
