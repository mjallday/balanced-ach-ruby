#!/usr/bin/env ruby
require 'ruby-debug'

$:.unshift("/Users/mahmoud/code/poundpay/ruby/balanced-ach/lib")
require "balanced"
Balanced.configure(nil, {
    :scheme => 'http',
    :host => 'localhost',
    :port => 9000,
    :version => 'a0',
})
ba = Balanced::BankAccount.new(
    :name => "Gottfried Leibniz",
    :account_number => "3819372930",
    :routing_number => "121042882",
    :type => "checking"
).save
credit = ba.credit(:amount => 1000)
p credit
debit = ba.debit(:amount => 1000)
p debit
p ba.unstore
