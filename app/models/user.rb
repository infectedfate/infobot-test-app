class User < ApplicationRecord
  include Clearance::User

  mount_uploader :avatar, AvatarUploader

  after_create :crop_avatar

  validates :email, uniqueness: true, format: { with: /.+@.+\..+/i }

  private

  def crop_avatar
    Cropper.perform_at(30.seconds, id)
  end
end
