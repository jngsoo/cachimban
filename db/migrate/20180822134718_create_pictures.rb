class CreatePictures < ActiveRecord::Migration[5.0]
  def change
    create_table :pictures do |t|
      t.string :imgsrc
      t.belongs_to :post, foreign_key: true

      t.timestamps
    end
  end
end
