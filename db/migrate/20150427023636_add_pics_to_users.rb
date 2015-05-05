class AddPicsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :pics, :string
  end
end

class CreatePics < ActiveRecord::Migration
  def change
    create_table :pics do |t|
      t.string :url
    end
  end
end
