class CreateDictamenes < ActiveRecord::Migration[6.0]
  def change
    create_table :dictamenes do |t|
      t.string :identificador
      t.text :texto
      t.references :expediente, null: false, foreign_key: true

      t.timestamps
    end
  end
end
