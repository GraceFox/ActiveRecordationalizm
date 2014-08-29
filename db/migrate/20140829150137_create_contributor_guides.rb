class CreateContributorGuides < ActiveRecord::Migration
  def change
    create_table :contributor_guides do |t|
      t.integer :contributor_id
      t.integer :guide_id
      t.integer :vote, default: 0
    end
  end
end
