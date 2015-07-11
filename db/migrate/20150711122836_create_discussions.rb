class CreateDiscussions < ActiveRecord::Migration
  def change
    create_table :discussions do |t|
      t.string :title, null: false
      t.text :description, null: false

      t.timestamps null: false
    end
  end
end
