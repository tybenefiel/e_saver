class ToDoList < ActiveRecord::Base
  belongs_to :user

  has_many :tasks

  has_many :tips, :through => :tasks

  def z
    x = User.find(id)
    return x.name
  end

  end
