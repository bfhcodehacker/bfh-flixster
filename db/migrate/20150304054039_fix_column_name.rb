class FixColumnName < ActiveRecord::Migration
  def change
    rename_column :lessons, :title, :subtitle
  end
end
