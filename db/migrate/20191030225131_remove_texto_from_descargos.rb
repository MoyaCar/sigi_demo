class RemoveTextoFromDescargos < ActiveRecord::Migration[6.0]
  def change
    remove_column :descargos, :texto, :text
  end
end
