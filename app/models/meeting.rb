class Meeting < ActiveRecord::Base
  acts_as_taggable
  normalize_attributes :account_id, :creator_id, :location_id

  belongs_to :account
  belongs_to :location
  belongs_to :creator, :class_name  => 'User'

  has_many :participants
  has_many :users, through: :participants
  has_many :tasks
  has_many :agenda_items

  validates_presence_of  :account, :name
end
