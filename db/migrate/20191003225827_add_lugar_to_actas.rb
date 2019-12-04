class AddLugarToActas < ActiveRecord::Migration[6.0]
  def change
    add_column :actas, :lugar, :string
  end
end
