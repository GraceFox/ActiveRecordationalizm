class Topic < ActiveRecord::Base
  has_many :guides
  default_scope { order(:name) }
end
