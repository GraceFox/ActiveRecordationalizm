class Contributor < ActiveRecord::Base
  has_many :contributor_guides
  has_many :guides, through: :contributor_guides

  validates :email, uniqueness: true
  validates :email, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+/}
  validates :name, uniqueness: true
  validates :name, length: {minimum: 2}
  validates :password, length: {minimum: 4}

  def is_password_valid(input)
    input == password
  end

  def error_message

  end


end

