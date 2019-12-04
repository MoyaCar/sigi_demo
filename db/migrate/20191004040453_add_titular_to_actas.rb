class AddTitularToActas < ActiveRecord::Migration[6.0]
  def change
    add_column :actas, :titular, :string
  end
end
