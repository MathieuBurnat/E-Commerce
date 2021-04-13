class CreateComment < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.string :comment, limit: 3000
      t.integer :mark
      t.references :client, foreign_key: true
      t.references :supplier, foreign_key: true
      t.references :product, foreign_key: true
    end
  end
end
