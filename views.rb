class GenericView
  def self.render with_data: nil, named: nil
    data = with_data

    data[:view_name] = named

    data.inspect
  end
end


