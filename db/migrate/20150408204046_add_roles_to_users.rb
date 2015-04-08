class AddRolesToUsers < ActiveRecord::Migration
  def change
	add_column "users", "admin", :boolean, :default => false
	add_column "users", "customer", :boolean, :default => true
  end
end
