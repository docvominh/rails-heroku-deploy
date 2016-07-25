class SearchUserModel
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_accessor :user_id, :user_name

  def initialize(user_id, user_name)
    @user_id = user_id
    @user_name = user_name
  end

  def persisted?
    false
  end
end
