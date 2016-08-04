# == Schema Information
#
# Table name: resources
#
#  id         :integer          not null, primary key
#  title      :string
#  abstract   :text
#  url        :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  image      :text
#  user_id    :integer
#

class Resource < ApplicationRecord
  has_and_belongs_to_many :categories
  belongs_to :user

  before_save :parse_data

  scope :recent, -> { ordered.limit 5 }
  scope :ordered, -> { order(created_at: :desc) }
  
  def to_s
    "#{title}"
  end

  protected

  def parse_data
    page = MetaInspector.new(url)
    self.title = page.best_title
    self.abstract = page.description
    self.url = page.untracked_url
    self.image = page.images.best
  end
end
