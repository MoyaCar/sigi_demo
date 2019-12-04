class AddDomicilioToActas < ActiveRecord::Migration[6.0]
  def change
    add_column :actas, :domicilio, :string
  end
end
