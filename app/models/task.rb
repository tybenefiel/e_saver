class Task < ActiveRecord::Base
  belongs_to :tip
  belongs_to :to_do_list


end
