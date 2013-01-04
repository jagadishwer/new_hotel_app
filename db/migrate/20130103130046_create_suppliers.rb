class CreateSuppliers < ActiveRecord::Migration
  def change
    create_table :suppliers do |t|
     t.string :name
     t.string :description
     

      t.timestamps
    end
  end
end
