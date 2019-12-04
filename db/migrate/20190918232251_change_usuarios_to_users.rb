class ChangeUsuariosToUsers < ActiveRecord::Migration[6.0]
  def change
    rename_table :usuarios, :users
  end
end
