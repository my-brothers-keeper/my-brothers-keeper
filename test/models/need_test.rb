require 'test_helper'

class NeedTest < ActiveSupport::TestCase
  test 'item is required' do
    need = Need.new(item: '')

    need.valid?

    assert_equal ["can't be blank"], need.errors.messages[:item]
  end
end
