class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.string :name
      t.text :text
      t.references :story_status
      t.references :user
      
      t.timestamps
    end
  end
end
