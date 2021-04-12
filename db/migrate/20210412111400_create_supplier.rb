class CreateSupplier < ActiveRecord::Migration[6.0]
  def change
    create_table :suppliers do |t|
      t.string :name, limit: 50, null: false
    end
  end
end
