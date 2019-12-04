class AddFechaDeAsociacion < ActiveRecord::Migration[6.0]
  def change
    add_column :expedientes, :fecha_de_asociacion, :datetime
  end
end
