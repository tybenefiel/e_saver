class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :tips
  has_one :to_do_list
  has_many :tasks, :through => :to_do_list
  has_many :todo_tips, :through => :tasks, :source => :tip

  def name
    return"#{first_name} #{last_name}"
  end

  # validates :first_name, :presence => true
  # validates :last_name, :presence => true

end
