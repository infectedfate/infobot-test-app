class Cropper
  include Sidekiq::Worker

  def perform(id)
    user ||= User.find(id)
    user.update(avatar: user.avatar.thumb) if user.avatar?
  end
end