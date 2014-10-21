class Device < ActiveRecord::Base
  normalize_attributes :user_id
  validates_presence_of :user_id, :device_token
  validates_uniqueness_of :device_token

  belongs_to :user
end
