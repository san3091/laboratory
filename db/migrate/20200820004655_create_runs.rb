class CreateRuns < ActiveRecord::Migration[6.0]
  def change
    create_table :runs do |t|
      t.string :title
      t.string :description
      t.references :experiment, null: false, foreign_key: true

      t.timestamps
    end
  end
end
