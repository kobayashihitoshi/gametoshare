class CreateCommunityUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :community_users do |t|
      t.references :user, foreign_key: true
      t.references :community, foreign_key: true

      t.timestamps
    end
  end
end
