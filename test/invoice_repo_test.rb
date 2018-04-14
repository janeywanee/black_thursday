require_relative 'test_helper'
require_relative '../lib/invoice_repo'

class InvoiceRepoTest < Minitest::Test
  attr_reader :invoice_repo,
              :parent

  def setup
    data = LoadFile.load('./test/fixture_data/invoice_repo_fixture.csv')
    @parent = Minitest::Mock.new
    @invoice_repo = InvoiceRepo.new(data, parent)
  end

  def test_it_exists
    assert_instance_of InvoiceRepo, invoice_repo
  end

  def test_it_returns_am_array_of_all_invoices
    assert_equal 10, invoice_repo.all.count
    assert_instance_of Array, invoice_repo.all
    assert_instance_of Invoice, invoice_repo.all.sample
  end

  def test_it_returns_nil_if_there_is_no_id
    assert_nil invoice_repo.find_by_id(2)
  end

  def test_it_can_find_all_customers
    assert_equal 8, invoice_repo.find_all_by_customer_id(1).count
  end

  def test_it_returns_array_if_no_valid_cust_id
    assert_equal [], invoice_repo.find_all_by_customer_id(0000000)
  end

  def test_it_can_find_all_by_merchant_id
    assert_equal 1, invoice_repo.find_all_by_merchant_id(12334269).count
  end

  def test_it_returns_empty_array_if_no_valid_merchant_id
    assert_equal [], invoice_repo.find_all_by_merchant_id(0000000)
  end
end
