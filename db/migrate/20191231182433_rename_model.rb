class RenameModel < ActiveRecord::Migration[5.2]
  def change
    rename_table :status_codes, :codes
  end
end
