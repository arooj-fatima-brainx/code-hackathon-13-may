class CreateTasks < ActiveRecord::Migration[8.1]
  def change
    create_table :tasks do |t|
      t.references :brief, null: false, foreign_key: true
      t.text :description
      t.string :status

      t.timestamps
    end
  end
end
