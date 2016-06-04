class AddDefaultToItems < ActiveRecord::Migration
  def up
  	change_column :items, :complete, :boolean, :default => false
  	change_column :items, :assigned, :boolean, :default => false
	end

	def down
  	change_column :items, :complete, :boolean
  	change_column :items, :assigned, :boolean
  end

end
