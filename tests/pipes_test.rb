require 'minitest/autorun'

require_relative '../lib/pipes'

class TestPipes < Minitest::Test

  def test_handle_router_with_nonexistent_route
    assert_equal handle_router(with_action: 'GET', and_route: '/abcdefg', and_params: {}),
                 nil
  end

  def test_handle_router_with_working_route
    assert_equal handle_router(with_action: 'GET', and_route: '/test_route', and_params: {}),
                 'render view!'
  end

  def test_get_handle_with_nonexistent_route
    assert_equal get_handle(with_action: 'GET', and_route: '/abcdefg'),
                 nil
  end

  def test_get_handle_with_nonexistent_route
    assert_equal get_handle(with_action: 'GET', and_route: '/test_route'),
                 {
                    pipeline: :TestPipeline,
                    presenter: :TestPresenter,
                    view_engine: :TestView,
                    view_name: :test_view,
                    params: [:name, :other]
                 }
  end

  def test_build_ppv_with_valid_handle
    handle = OpenStruct.new(ROUTES['[GET] /test_route'])
    assert_equal build_ppv(from_handle: handle),
                 [TestPipeline, TestPresenter, TestView]
  end

  def test_build_params_with_valid_input
    params = { foo: 'wat', name: 'Bob' }
    keys =  [:name]
    assert_equal build_params(from_params: params, with_keys: keys),
                 { name: 'Bob' }
  end

end


# test fakes

ROUTES = {
  '[GET] /test_route' => {
      pipeline: :TestPipeline,
      presenter: :TestPresenter,
      view_engine: :TestView,
      view_name: :test_view,
      params: [:name, :other]
  }
}

class TestPipeline

  def self.execute with_params: nil
    params = with_params

    { output: params }
  end
  
end


class TestPresenter 

  def self.build with_data: nil
    data = with_data

    return data
  end

end

class TestView
  def self.render with_data: nil, named: nil
    data = with_data
    view_name = named

    'render view!' 
  end
end







