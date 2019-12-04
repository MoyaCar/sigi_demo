class AddTipoDeInfraccionToActas < ActiveRecord::Migration[6.0]
  def change
    add_reference :actas, :tipo_de_infraccion, index: true, null: true, foreign_key: true
  end
end
