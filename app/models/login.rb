class Login
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_accessor :user_id, :password

  validates :user_id, :presence => true
  validates :password, :presence => true

  def initialize(user_id, password)
    @user_id = user_id
    @password = password
  end

  def persisted?
    false
  end
end