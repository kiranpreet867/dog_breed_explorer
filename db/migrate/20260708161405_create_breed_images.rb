class CreateBreedImages < ActiveRecord::Migration[7.2]
  def change
    create_table :breed_images do |t|
      t.string :image_url
      t.references :breed, null: false, foreign_key: true

      t.timestamps
    end
  end
end
