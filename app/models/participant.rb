class Participant < ActiveRecord::Base
  normalize_attributes :meeting_id, :user_id

  belongs_to :meeting
  belongs_to :user

  validates_presence_of  :meeting, :user
end
