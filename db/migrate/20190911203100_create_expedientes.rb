class CreateExpedientes < ActiveRecord::Migration[6.0]
  def change
    create_table :expedientes do |t|
      t.string :identificador, null: false, default: ''

      t.timestamps
    end

    add_index :expedientes, :identificador, unique: true
  end
end
