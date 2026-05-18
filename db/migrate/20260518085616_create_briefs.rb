class CreateBriefs < ActiveRecord::Migration[8.1]
  def change
    create_table :briefs do |t|
      t.text :raw_text
      t.jsonb :structured_data
      t.string :status

      t.timestamps
    end
  end
end
