class Migrate20200420 < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :birth
    add_column :users, :birth, :datetime
  end
end
