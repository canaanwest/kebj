class AddColumnsToReviews < ActiveRecord::Migration[5.1]
  def change
    add_column :reviews, :text, :string
    add_column :reviews, :name, :string
    add_column :reviews, :relationship, :string
  end
end
