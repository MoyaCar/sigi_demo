class ChangeFechaOnActas < ActiveRecord::Migration[6.0]
  def up
    change_column :actas, :fecha, :datetime
  end

  def down
    change_column :actas, :fecha, :date
  end
end
