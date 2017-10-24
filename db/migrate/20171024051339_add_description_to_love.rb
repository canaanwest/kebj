class AddDescriptionToLove < ActiveRecord::Migration[5.1]
  def change
    add_column :loves, :description, :string
  end
end
