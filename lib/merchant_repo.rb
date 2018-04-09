require 'csv'
require_relative 'merchant'

class MerchantRepo
  attr_reader :all


  def initialize(csv_file)
    @all = []
    open_file(csv_file)

  end

  def open_file(file)
    CSV.foreach(file,  headers: true, header_converters: :symbol) do |row|
      all << Merchant.new(row)
    end
  end

  def find_by_id(id)
    all.find do |merchant|
      merchant.id == id
    end
  end

  def find_by_name(name)

  end
end
