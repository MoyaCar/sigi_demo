class CreateResoluciones < ActiveRecord::Migration[6.0]
  def change
    create_table :resoluciones do |t|
      t.text :observacion
      t.integer :multa
      t.references :dictamen, null: false, foreign_key: true

      t.timestamps
    end
  end
end
