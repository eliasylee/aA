class ShortenedURL < ActiveRecord::Base
  include SecureRandom

  belongs_to :submitter,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: "User"

  has_many :visits,
    primary_key: :id,
    foreign_key: :url_id,
    class_name: 'Visit'

  has_many :visitors,
    -> { distinct },
    through: :visits,
    source: :visitor

  has_many :taggings,
    primary_key: :id,
    foreign_key: :url_id,
    class_name: "Tagging"

  has_many :tag_topics,
    through: :taggings,
    source: :tag_topic

  def self.random_code
    rand_code = SecureRandom.urlsafe_base64

    unless ShortenedURL.exists?(:short_url => rand_code)
      rand_code = SecureRandom.urlsafe_base64
    end

    rand_code
  end

  def self.create_for_user_and_long_url!(user, long_url)
    ShortenedURL.create!({user_id: user.id, long_url: long_url, short_url: ShortenedURL.random_code})
  end

  def num_clicks
    self.visits.count
  end

  def num_uniques
    self.visitors.count
  end

  def num_recent_uniques
    self.visits.where("created_at < '#{10.minutes.ago}'").select(:user_id).distinct.count
  end

end
