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

require 'test_helper'

class ResourceTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
