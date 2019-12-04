class RemoveInfraccionFromActas < ActiveRecord::Migration[6.0]
  def change

    remove_column :actas, :infraccion, :string
  end
end
