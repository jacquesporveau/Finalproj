class Addfloattovalue < ActiveRecord::Migration
  def change
    change_column :nutrients, :value, :float 
  end
end
