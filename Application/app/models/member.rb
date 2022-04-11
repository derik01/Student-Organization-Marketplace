class Member < ActiveRecord::Base
    has_secure_password
    belongs_to :user
    has_many :users

    def self.from_omniauth(auth)
        where(username: auth.info.email).first_or_initialize do |user|
            user.first = auth.info.first_name
            user.last = auth.info.last_name
            user.username = auth.info.email
            user.password = SecureRandom.hex
        end
    end
end
