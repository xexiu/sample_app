class Micropost < ActiveRecord::Base
  # attr_accessor :content
  belongs_to :user
  default_scope { order('microposts.created_at DESC') }
  # Return microposts from the users being followed by the given user.
  scope :from_users_followed_by, lambda { |user| followed_by(user) }
  # From Newest to Oldest
  validates :content, :presence => true, :length => { :maximum => 140 }
  validates :user_id, :presence => true

  def self.from_users_followed_by(user)
    followed_ids = user.following.map(&:id).join(", ")
    where("user_id IN (#{followed_ids}) OR user_id = ?", user)
  end

private

  def self.followed_by(user)
    followed_ids = %(SELECT followed_id FROM relationshipsWHERE follower_id = :user_id)
    where("user_id IN (#{followed_ids}) OR user_id = :user_id",{ :user_id => user })
  end

end
