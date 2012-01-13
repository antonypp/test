class CreateStoryComments < ActiveRecord::Migration
  def change
    create_table :story_comments do |t|
      t.string :comment
      t.text :text
      t.references :story
      t.references :user

      t.timestamps
    end
    add_index :story_comments, :story_id
    add_index :story_comments, :user_id
  end
end
