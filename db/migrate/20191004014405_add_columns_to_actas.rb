class AddColumnsToActas < ActiveRecord::Migration[6.0]
  def change
    add_column :actas, :dominio, :string
  end
end
