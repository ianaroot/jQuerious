class User < ActiveRecord::Base

  has_many :surveys #alias to :created_surveys
  # also look into the :dependent => :destroy option
  has_many :answers
  # define association to choices
  # define associations to taken surveys and use the alias :taken_surveys (i.e., calling user.taken_surveys should return an array of all the surveys a user has taken)

  # add validations

  include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end


end
