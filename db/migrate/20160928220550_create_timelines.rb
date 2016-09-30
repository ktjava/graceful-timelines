class CreateTimelines < ActiveRecord::Migration[5.0]
  def change
    create_table :timelines do |t|
      t.date :posted_date
      t.string :sns_name
      t.string :message

      t.timestamps
    end
  end
end
