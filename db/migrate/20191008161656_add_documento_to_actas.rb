class AddDocumentoToActas < ActiveRecord::Migration[6.0]
  def change
    add_column :actas, :documento, :string
  end
end
