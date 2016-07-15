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
#

class Resource < ApplicationRecord

  before_save :parse_data

  protected

  def parse_data
    page = MetaInspector.new(url)
    self.title = page.best_title
    self.abstract = page.description
    self.url = page.untracked_url
    self.image = page.images.best
  end
end
