class CreateJiraTickets < ActiveRecord::Migration[8.1]
  def change
    create_table :jira_tickets do |t|
      t.references :task, null: false, foreign_key: true
      t.string :jira_id
      t.string :url
      t.string :status

      t.timestamps
    end
  end
end
