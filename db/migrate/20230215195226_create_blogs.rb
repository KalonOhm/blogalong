class CreateBlogs < ActiveRecord::Migration[7.0]
  def change
    create_table :blogs do |t|
      t.string :title
      t.string :content
      t.string :image_path, default: "https://creazilla-store.fra1.digitaloceanspaces.com/cliparts/60610/empty-aquarium-clipart-md.png"

      t.timestamps
    end
  end
end
