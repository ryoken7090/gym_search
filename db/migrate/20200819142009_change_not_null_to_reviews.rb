class ChangeNotNullToReviews < ActiveRecord::Migration[5.2]
  def up
    change_column :reviews, :free_weight, :integer, null:false
    change_column :reviews, :machine, :integer, null:false
    change_column :reviews, :caedio, :integer, null:false
  end

  def down
    change_column :reviews, :free_weight, :integer
    change_column :reviews, :machine, :integer
    change_column :reviews, :caedio, :integer
  end
end
