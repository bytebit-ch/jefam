class CreateAttractions < ActiveRecord::Migration
  def change
    create_table :attractions do |t|
      t.string :name
      t.string :parish
      t.string :age_range
      t.string :price
      t.string :attr_url
      t.string :description
      t.string :map_url
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
