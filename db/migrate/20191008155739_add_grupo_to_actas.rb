class AddGrupoToActas < ActiveRecord::Migration[6.0]
  def change
    add_column :actas, :grupo, :string
  end
end
