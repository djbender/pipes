require "minitest/autorun"

require_relative '../pipelines'

class TestOtherPipeline < Minitest::Test

  def test_that_setup_should_return_the_hi_greeting
    assert_equal OtherPipeline.execute(), 
                 greeting: 'hi'
  end

end


class TestCreateUser < Minitest::Test

  def test_that_execute_should_return_output
    assert_equal CreateUser.execute(with_params: {name: 'bob'}), 
                 output: 'bob'
  end

end


class TestDoMagic < Minitest::Test 

  def test_that_execute_should_return_output
    assert_equal DoMagic.execute(with_params: {other: 'weird'}),
                 output: 'weird', greeting: 'hi'
  end

end
