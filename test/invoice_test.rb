require_relative 'test_helper'
require_relative '../lib/invoice'

class InvoiceTest < Minitest::Test
  attr_reader :invoice

  def setup
    @invoice = Invoice.new({ :id => 5,
                              :customer_id =>6,
                              :merchant_id =>7,
                              :status =>"pending",
                              :created_at => "2018-04-10",
                              :updated_at => "2018-04-10"
                                }, self)
  end


  def test_it_exists
    assert_instance_of Invoice, invoice
  end

  def test_it_retunrs_the_integer_id
    assert_equal 5, invoice.id
  end
end
