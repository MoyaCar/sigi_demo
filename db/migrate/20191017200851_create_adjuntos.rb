class CreateAdjuntos < ActiveRecord::Migration[6.0]
  def change
    create_table :adjuntos do |t|
      t.references :adjuntable, polymorphic: true
      t.string :referencia, null: false

      t.timestamps
    end
  end
end
