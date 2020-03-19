class User < ApplicationRecord
  include Clearance::User

  mount_uploader :avatar, AvatarUploader
end
