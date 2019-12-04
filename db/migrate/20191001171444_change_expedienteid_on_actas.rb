class ChangeExpedienteidOnActas < ActiveRecord::Migration[6.0]
  def change
    change_column_null :actas, :expediente_id, true
  end
end
