class AddFechaDeAsociacionToActas < ActiveRecord::Migration[6.0]
  def change
    add_column :actas, :fecha_de_asociacion, :datetime
  end
end
