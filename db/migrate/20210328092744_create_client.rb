class CreateClient < ActiveRecord::Migration[6.1]
  def change
    create_table :clients do |t|
      t.string :firstname, limit: 20
      t.string :lastname, limit: 20
    end
  end
end
