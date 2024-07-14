class CreateTitulos < ActiveRecord::Migration[7.1]
  def change
    create_table :titulos do |t|
      t.string :titulos

      t.timestamps
    end
  end
end
