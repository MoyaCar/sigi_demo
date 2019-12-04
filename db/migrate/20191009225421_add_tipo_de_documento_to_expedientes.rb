class AddTipoDeDocumentoToExpedientes < ActiveRecord::Migration[6.0]
  def change
    add_column :expedientes, :tipo_de_documento, :string
  end
end
