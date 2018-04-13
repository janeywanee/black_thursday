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
end
