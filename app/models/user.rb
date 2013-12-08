class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :tips
  has_one :to_do_list
  has_many :tasks, :through => :to_do_list
  has_many :todo_tips, :through => :tasks, :source => :tip

  after_create :create_to_do_list

  def create_to_do_list
    t = ToDoList.new
    t.user_id = id
    t.save
  end

  def this_user
    this_user = current_user.user_id
  end

  def name
    return"#{first_name} #{last_name}"
  end

  # validates :first_name, :presence => true
  # validates :last_name, :presence => true

end
