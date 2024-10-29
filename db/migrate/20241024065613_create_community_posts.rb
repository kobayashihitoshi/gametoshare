class CreateCommunityPosts < ActiveRecord::Migration[6.1]
  def change
    create_table :community_posts do |t|
      t.string :body
      t.references :user, foreign_key: true
      t.references :community, foreign_key: true

      t.timestamps
    end
  end
end
