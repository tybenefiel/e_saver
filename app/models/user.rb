class User < ActiveRecord::Base
  has_many :tips
  has_one :to_do_list
  has_many :tasks, :through => :to_do_list
  has_many :todo_tips, :through => :tasks, :source => :tip

  def name
    return"#{first_name} #{last_name}"
  end
end
