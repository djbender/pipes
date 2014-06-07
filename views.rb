require 'slim'
require 'tilt'

class GenericView
  def self.render with_data: nil, named: nil
    data = with_data

    view_name = named

    Tilt.new("views/#{view_name}.slim").render(OpenStruct.new(data))
  end
end


