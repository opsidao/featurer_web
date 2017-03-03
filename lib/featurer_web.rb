require 'featurer_web/engine'

module FeaturerWeb
  INVALD_ADMIN_USERS_MSG = <<-MESSAGE.strip_heredoc
    admin_users must be an empty array or an array of hashes with the following format:
    [
      {
        username: "the_login_username",
        password_sha256: Digest::SHA256.digest("password")
      }
    ]
  MESSAGE

  def self.admin_users=(admin_users)
    all_is_good = admin_users.is_a?(Array) && admin_users.all? do |admin_user|
      admin_user.is_a?(Hash) && admin_user[:username] && admin_user[:password_sha256]
    end

    raise INVALD_ADMIN_USERS_MSG unless all_is_good

    @admin_users = admin_users
  end

  def self.admin_users
    @admin_users || []
  end
end
