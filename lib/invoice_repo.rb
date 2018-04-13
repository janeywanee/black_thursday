
require 'csv'
require 'time'
require_relative 'invoice'
require_relative '../lib/load_file'

class InvoiceRepo
  attr_reader :invoices,
              :parent

  def initialize(data, parent)
    @invoices = data.map {|row| Invoice.new(row, self)}
    @parent = parent
  end

  def all
    invoices
  end

  def find_by_id(id)
    all.find do |invoice| 
      invoice.id == id
    end
    nil
  end
end
