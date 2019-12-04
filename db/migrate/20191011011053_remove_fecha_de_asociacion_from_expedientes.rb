class RemoveFechaDeAsociacionFromExpedientes < ActiveRecord::Migration[6.0]
  def change
    remove_column :expedientes, :fecha_de_asociacion, :datetime
  end
end
