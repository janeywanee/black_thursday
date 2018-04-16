class Merchant
  attr_reader :id,
              :parent
  attr_accessor :name,
                :created_at,
                :updated_at

  def initialize(data, parent)
    @id         = data[:id].to_i
    @name       = data[:name]
    @created_at = data[:created_at]
    @updated_at = data[:updated_at]
    @parent     = parent
  end

  def created_at
    Time.parse(@created_at.to_s)
  end

  def updated_at
    Time.parse(@updated_at.to_s)
  end
end
