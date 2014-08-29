class Guide < ActiveRecord::Base
  belongs_to :topic
  default_scope { order(:name) }
  validates :name, uniqueness: true
  validates :name, length: {minimum: 2}
  validates :explanation, length: {minimum: 2}
end
