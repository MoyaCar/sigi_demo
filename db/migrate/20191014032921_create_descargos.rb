class CreateDescargos < ActiveRecord::Migration[6.0]
  def change
    create_table :descargos do |t|
      t.references :acta, null: false, foreign_key: true

      t.timestamps
    end
  end
end
