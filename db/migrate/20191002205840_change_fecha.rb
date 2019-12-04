class ChangeFecha < ActiveRecord::Migration[6.0]
  def change
    rename_column :actas, :fecha, :fecha_y_hora
  end
end
