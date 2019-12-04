class RemoveObservacionFromResoluciones < ActiveRecord::Migration[6.0]
  def change
    remove_column :resoluciones, :observacion, :text
  end
end
