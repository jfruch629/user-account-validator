class UserAccountValidator
  attr_reader :email, :username, :name

  def initialize(info_hash)
    @email = info_hash[:email]
    if @email.nil? || !@email.include?("@")
      raise MissingInfoError.new('You are missing an email or the @ in your email routing address.')
    end

    @username = info_hash[:username]
    if @username.nil?
      raise MissingInfoError.new('You are missing a username')
    end

    @name = info_hash[:name]
  end

  class MissingInfoError < StandardError
  end
end
