require 'json'
require 'csv'

# file_path of json with data
file_string = File.read('transactions.json')
data_hash = JSON.parse(file_string)

class BankTransaction
  def initialize(bank_account_name, reference)
    @bank_account_name = bank_account_name
    @reference = reference
    @line_items = []
  end

  def add_line_items(raw_line_items)
    raw_line_items.each do |raw_item|
      line_item_id = raw_item.dig('LineItemID')
      account_code = raw_item.dig('AccountCode')
      description = raw_item.dig('Description')
      line_amount = raw_item.dig('LineAmount')

      @line_items.push(BankLineItem.new(line_item_id, account_code, description, line_amount))
    end
  end

  def csv_lines
    @line_items.map do |line_item|
      [line_item.line_item_id, line_item.account_code, line_item.description, line_item.line_amount]
    end
  end

  def self.create_from_raw_data(transaction)
    bank_account_name = transaction.dig('BankAccount', 'Name') 
    reference = transaction['Reference']
    BankTransaction.new(bank_account_name, reference)
  end
end
  
class BankLineItem
  attr_accessor :line_item_id, :account_code, :description, :line_amount

  def initialize(line_item_id, account_code, description, line_amount)
    @line_item_id = line_item_id
    @description = description
    @account_code = account_code
    @line_amount = line_amount 
  end
end

# array to hold bank_transaction objects
all_bank_transactions = [];

# parse raw_hash into BankTransaction and BankLineItem objects
data_hash['BankTransactions'].each do |transaction|
  bank_transaction = BankTransaction.create_from_raw_data(transaction)
  bank_transaction.add_line_items(transaction['LineItems'])
  all_bank_transactions << bank_transaction
end

# Generate CSV string
csv_string = CSV.generate do |csv|
  # Headers
  csv << ["LineItemId", "AccountCode", "Description", "LineAmount", "BankAccountName", "Reference"]

  all_bank_transactions.each do |transaction|
    transaction.csv_lines.map { |line| csv << line }
  end
end

# Print CSV to STDOUT
puts csv_string
