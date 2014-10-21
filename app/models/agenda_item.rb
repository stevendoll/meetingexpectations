class AgendaItem < ActiveRecord::Base
  normalize_attributes :meeting_id

  belongs_to :meeting

  validates_presence_of  :name, :meeting
end
