require 'securerandom'

class ShortenedUrl < ApplicationRecord
  validates :long_url, uniqueness: true, presence: true

  belongs_to :submitter,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: 'User'

  has_many :visits,
    primary_key: :id,
    foreign_key: :short_url_id,
    class_name: 'Visit'

  has_many :visitors,
    Proc.new { distinct },
    through: :visits,
    source: :user

  has_many :taggings,
    primary_key: :id,
    foreign_key: :url_id,
    class_name: 'Tagging'

  has_many :tags,
    through: :taggings,
    source: :tag

  def self.make_short!(user,long_url)
    ShortenedUrl.create(user_id: user.id,long_url: long_url)
  end

  def self.random_code
    SecureRandom.urlsafe_base64
  end

  def self.exists?(short_url)
    ShortenedUrl.find_by(short_url: short_url) ? true : false
  end

  def initialize(options)
    super(options)
    self.short_url = ShortenedUrl.random_code
    while ShortenedUrl.exists?(self.short_url)
      self.short_url = ShortenedUrl.random_code
    end
  end

  def num_clicks
    self.visits.count
  end

  def num_uniques
    self.visitors.count
  end

  def num_recent_uniques
    self.visits.select(:user_id).distinct.where(created_at: (10.minutes.ago..Time.now)).count
  end
end
