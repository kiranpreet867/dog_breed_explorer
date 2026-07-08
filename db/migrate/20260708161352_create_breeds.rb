class CreateBreeds < ActiveRecord::Migration[7.2]
  def change
    create_table :breeds do |t|
      t.string :name
      t.string :bred_for
      t.string :breed_group
      t.text :temperament
      t.string :life_span
      t.string :origin
      t.string :reference_image_id

      t.timestamps
    end
  end
end
