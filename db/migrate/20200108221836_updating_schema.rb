class UpdatingSchema < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :teacher, :boolean
    add_column :codes, :variant, :string
    add_column :sessions, :live, :boolean
    remove_column :sessions, :status, :string
  end
end
