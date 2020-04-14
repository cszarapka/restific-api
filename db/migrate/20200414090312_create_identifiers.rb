class CreateIdentifiers < ActiveRecord::Migration[5.0]
  def change
    create_table :identifiers do |t|
      t.references :user, index: true, foreign_key: true, null: false
      t.string :key, default: 'default', null: false
      t.integer :value, default: 0, null: false

      t.timestamps
    end
  end
end
