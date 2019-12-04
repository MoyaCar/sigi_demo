class AddTipoDeServicioToActas < ActiveRecord::Migration[6.0]
  def change
    add_column :actas, :tipo_de_servicio, :string
  end
end
