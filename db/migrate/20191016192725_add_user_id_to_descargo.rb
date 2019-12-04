class AddUserIdToDescargo < ActiveRecord::Migration[6.0]
  def change
    add_reference :descargos, :user, index: true, null: false, foreign_key: true
  end
end
