class ChangeDataTypeForCookingTime < ActiveRecord::Migration[7.0]
  def self.up
    change_table :recipes do |t|
      t.change :cooking_time, :string
    end
  end
  def self.down
    change_table :recipes do |t|
      t.change :cooking_time, :datetime
    end
  end
end
