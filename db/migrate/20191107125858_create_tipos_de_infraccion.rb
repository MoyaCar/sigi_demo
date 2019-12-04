class CreateTiposDeInfraccion < ActiveRecord::Migration[6.0]
  def change
    create_table :tipos_de_infraccion do |t|
      t.string :identificador
      t.text :descripcion

      t.timestamps
    end
  end
end
