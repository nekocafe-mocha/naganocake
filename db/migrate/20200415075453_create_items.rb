class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|

      t.string :name, null: false
      t.text :caption, null: false
      t.integer :price, null: false
      t.string :image_id, null: false
      t.integer :status, null: false, default: "0"
      t.integer :category_id, null: false

      t.timestamps

    end
  end
end
