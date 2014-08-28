class CreateContributors < ActiveRecord::Migration
  def change
    create_table :contributors do |t|
      t.string :name
      t.string :email
      t.string :password
      t.timestamps
    end
  end
end
