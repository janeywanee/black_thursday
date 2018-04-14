
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
    invoices.find do |invoice|
      invoice.id == id
    end
    nil
  end

  def find_all_by_customer_id(cust_id)
    invoices.find_all do |invoice|
      invoice.customer_id == cust_id
    end
  end

  def find_all_by_merchant_id(merch_id)
    invoices.find_all do |invoice|
      invoice.merchant_id == merch_id
    end
  end

  def find_all_by_pending_status(status)
    invoices.find_all do |invoice|
      invoice.status == status
    end
  end
end
