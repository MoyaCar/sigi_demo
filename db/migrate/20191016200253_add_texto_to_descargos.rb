class AddTextoToDescargos < ActiveRecord::Migration[6.0]
  def change
    add_column :descargos, :texto, :text
  end
end
