class CreateEventsCategories < ActiveRecord::Migration
  def change
    
    create_table :categories do |t|
      t.string :name
      t.timestamps
    end
    
    Category.create :name => 'Urlaub', :color => '#FFFF00'
    Category.create :name => 'Feiertag', :color => '#FF0000'
    
    create_table :events do |t|
      t.string :name
      t.references :user
      t.references :category
      t.datetime :start_at
      t.datetime :end_at
      t.boolean :all_day, :default => true
      t.timestamps
    end
  end
end
