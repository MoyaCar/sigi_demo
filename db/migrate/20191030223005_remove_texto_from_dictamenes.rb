class RemoveTextoFromDictamenes < ActiveRecord::Migration[6.0]
  def change
    remove_column :dictamenes, :texto, :text
  end
end
