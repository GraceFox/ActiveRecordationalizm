class CreateGuides < ActiveRecord::Migration
  def change
  	create_table :guides do |t|
  	  t.string :name
  	  t.text :explanation
  	  t.references :topic
  	  t.timestamps
  	end
  end
end
