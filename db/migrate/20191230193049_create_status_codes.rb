class CreateStatusCodes < ActiveRecord::Migration[5.2]
  def change
    create_table :status_codes do |t|
      t.string :color
      t.string :description

      t.timestamps
    end
  end
end
