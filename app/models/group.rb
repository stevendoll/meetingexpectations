class Group < ActiveRecord::Base
  normalize_attributes :account_id, :creator_id, :parent_group_id

  belongs_to :account
  belongs_to :parent_group, :class_name  => 'Group'
  belongs_to :creator, :class_name  => 'User'
  has_many :groups,  :class_name  => 'Group', :foreign_key => 'parent_group_id'

  accepts_nested_attributes_for :groups, :reject_if => lambda { |t| t[:name].blank? }

  validates_presence_of  :account, :name
end
