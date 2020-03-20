class User < ApplicationRecord
  include Clearance::User

  mount_uploader :avatar, AvatarUploader

  after_save :crop_avatar

  validates :password, length: { in: 6..20 }

  private

  def crop_avatar
    Cropper.perform_at(30.seconds, id)
  end
end
