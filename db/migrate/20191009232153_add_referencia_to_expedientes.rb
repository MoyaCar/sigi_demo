class AddReferenciaToExpedientes < ActiveRecord::Migration[6.0]
  def change
    add_column :expedientes, :referencia, :string
  end
end
