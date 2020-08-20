class CreateResults < ActiveRecord::Migration[6.0]
  def change
    create_table :results do |t|
      t.string :uuid
      t.json :data
      t.references :run, null: false, foreign_key: true

      t.timestamps
    end
  end
end
