class CreateArtifacts < ActiveRecord::Migration
  def change
    create_table :artifacts do |t|
      t.text :name
      t.text :key
      t.belongs_to :project, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
