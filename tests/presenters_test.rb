require 'minitest/autorun'

require_relative '../presenters'

class TestGenericPresenter < Minitest::Test

  def test_that_build_returns_data_with_no_translation
    input = { foo: 'bar' }
    assert_equal GenericPresenter.build(with_data: input),
                 input
  end

end
