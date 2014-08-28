class Contributor < ActiveRecord::Base
  # Remember to create a migration!
  def is_password_valid(input)
    input == password
  end
end

