class CreateRuns < ActiveRecord::Migration[6.0]
  def change
    create_table :runs do |t|
      t.string :uuid
      t.json :data

      t.timestamps
    end
  end
end
