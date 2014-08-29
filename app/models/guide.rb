class Guide < ActiveRecord::Base
  belongs_to :topic
  default_scope { order(:name) }
end
