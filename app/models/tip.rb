class Tip < ActiveRecord::Base
  belongs_to :user

  has_many :tasks

  has_many :to_do_lists, :through => :tasks

end
