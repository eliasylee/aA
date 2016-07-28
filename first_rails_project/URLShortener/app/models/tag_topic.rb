class TagTopic < ActiveRecord::Base

  has_many :taggings,
    primary_key: :id,
    foreign_key: :tag_id,
    class_name: "Tagging"

  has_many :short_urls,
    through: :taggings,
    source: :short_url

  def most_popular_link
    self.short_urls.sort {|short_url| short_url.num_uniques}.last
  end
end
