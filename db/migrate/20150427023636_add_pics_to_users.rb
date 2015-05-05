class AddPicsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :pics, :string
  end
end
