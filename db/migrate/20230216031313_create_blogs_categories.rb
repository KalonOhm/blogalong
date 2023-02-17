class CreateBlogsCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :blogs_categories do |t|
      t.integer :blog_id, null: false
      t.integer :category_id, null: false

      t.timestamps
    end
  end
end
