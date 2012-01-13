class CreateStoryStatuses < ActiveRecord::Migration
  def change
    create_table :story_statuses do |t|
      t.string :name
      t.references :story

      t.timestamps
    end
    add_index :story_statuses, :story_id
  end
end
