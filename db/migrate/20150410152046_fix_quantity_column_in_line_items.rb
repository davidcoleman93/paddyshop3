class FixQuantityColumnInLineItems < ActiveRecord::Migration
  def change
	remove_column :line_items, :quantity
	add_column :line_items, :quantity, :integer, default: 1
  end
end
