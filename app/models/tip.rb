class Tip < ActiveRecord::Base
  belongs_to :user
  has_many :tasks
  has_many :to_do_lists, :through => :tasks

  validates :user_id, :presence => true
  validates :title, :presence => true
  validates :description, :presence => true
  validates :room, :presence => true
  validates :price, :presence => true, numericality: { only_integer: true }
  validates :saving, :presence => true, numericality: { only_integer: true }

end
