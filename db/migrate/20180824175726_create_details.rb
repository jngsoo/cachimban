class CreateDetails < ActiveRecord::Migration[5.0]
  def change
    create_table :details do |t|
      t.string :tel
      t.string :doro
      t.string :time
      t.string :price
      t.belongs_to :post, foreign_key: true

      t.timestamps
    end
  end
end
