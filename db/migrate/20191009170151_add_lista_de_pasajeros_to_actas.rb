class AddListaDePasajerosToActas < ActiveRecord::Migration[6.0]
  def change
    add_column :actas, :lista_de_pasajeros, :boolean, null: false, default: false
  end
end
