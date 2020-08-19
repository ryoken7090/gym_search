class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.references :user, foreign_key: true
      t.references :facility, foreign_key: true
      t.text :content
      t.integer :machine
      t.integer :caedio
      t.integer :free_weight

      t.timestamps
    end
  end
end
