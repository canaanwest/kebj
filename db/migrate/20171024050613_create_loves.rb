class CreateLoves < ActiveRecord::Migration[5.1]
  def change
    create_table :loves do |t|
      t.string :love

      t.timestamps
    end
  end
end
