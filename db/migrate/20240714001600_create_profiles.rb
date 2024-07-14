class CreateProfiles < ActiveRecord::Migration[7.1]
  def change
    create_table :profiles do |t|
      t.string :nombre
      t.string :profesion
      t.text :resumen
      t.text :experiencia
      t.text :educacion
      t.text :habilidades
      t.text :idiomas
      t.text :proyectos
      t.text :contacto

      t.timestamps
    end
  end
end
