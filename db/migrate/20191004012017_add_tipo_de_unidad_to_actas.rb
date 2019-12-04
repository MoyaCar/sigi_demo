class AddTipoDeUnidadToActas < ActiveRecord::Migration[6.0]
  def change
    add_column :actas, :tipo_de_unidad, :string
  end
end
