class Location < ActiveRecord::Base
  normalize_attributes :account_id

  belongs_to :account
  has_many :meetings

  validates_presence_of  :account, :name
end
