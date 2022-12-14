class ChangeDataTypeForPreparationTime < ActiveRecord::Migration[7.0]
  def self.up
    change_table :recipes do |t|
      t.change :preparation_time, :string
    end
  end
  def self.down
    change_table :recipes do |t|
      t.change :preparation_time, :datetime
    end
  end
end
