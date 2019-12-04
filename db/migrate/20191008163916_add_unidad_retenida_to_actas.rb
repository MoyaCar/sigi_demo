class AddUnidadRetenidaToActas < ActiveRecord::Migration[6.0]
  def change
    add_column :actas, :unidad_retenida, :boolean, null: false, default: 'false'
  end
end
