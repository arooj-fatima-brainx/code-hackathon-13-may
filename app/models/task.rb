class Task < ApplicationRecord
  belongs_to :brief
  has_one :jira_ticket
end
