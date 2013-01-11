class CreateLogDatas < ActiveRecord::Migration
  def change
    create_table :log_data do |t|
      t.string :data
      t.datetime :date
      t.references :user
      t.timestamps
    end
  end
end
