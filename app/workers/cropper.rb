class Cropper
  include Sidekiq::Worker

  def perform(id)
    user = User.find id
    if user.avatar? && (user.avatar.height > 300 || user.avatar.width > 300)
      user.avatar.resize_to_fit 300, 300
    end
  end
end
