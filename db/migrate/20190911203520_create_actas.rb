class CreateActas < ActiveRecord::Migration[6.0]
  def change
    create_table :actas do |t|
      t.string :numero, null: false, default: ''
      t.string :infraccion
      t.date :fecha
      t.string :estado, null: false, default: 'inicial'

      t.references :expediente, null: false, foreign_key: true

      t.timestamps
    end

    add_index :actas, :numero, unique: true
  end
end
