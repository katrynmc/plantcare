class CreateArtifacts < ActiveRecord::Migration[6.0]
  def change
    create_table :artifacts do |t|
      t.string :src
      t.references :entry, null: false, foreign_key: true

      t.timestamps
    end
  end
end
