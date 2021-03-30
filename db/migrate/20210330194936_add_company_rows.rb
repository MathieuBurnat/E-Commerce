class AddCompanyRows < ActiveRecord::Migration[6.1]
  def change
    change_table :clients do |t|
      t.string :company_name, limit: 20
      t.string :type
    end
  end
end
