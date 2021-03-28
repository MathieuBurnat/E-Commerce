class Test < ActiveRecord::Migration[6.1]
  def change
    create_table :test do |t|
      t.string :name, limit: 60
    end
  end
end
