class ChangeColName < ActiveRecord::Migration[5.2]
  def change
    rename_column :statuses, :status_code_id, :code_id
  end
end
