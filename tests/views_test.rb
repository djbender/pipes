require 'minitest/autorun'

require_relative '../views'

class TestGenericView < Minitest::Test

  def test_that_render_returns_the_right_string
    assert_equal GenericView.render(with_data: {output: 'bob'}, named: :create_user),
                 'hi bob'
  end

end
