# Balanced

Online Marketplace Payments

[![Build Status](https://secure.travis-ci.org/balanced/balanced-ach-ruby.png)](http://travis-ci.org/balanced/balanced-ach-ruby)

## Installation

Add this line to your application's Gemfile:

    gem 'balanced-ach'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install balanced-ach

## Usage

### Create a Bank Account

    require 'balanced_ach'

    # create a bank account
    ba = Balanced::BankAccount.new(
        :name => "Gottfried Leibniz",
        :account_number => "3819372930",
	:routing_number => "121042882",
    	:type => "checking"
    ).save

    # credit this bank account $1.00 USD
    ba.credit(:amount => 100)

    # debit this bank account $1.00 USD
    ba.debit(:amount => 100)

    # retrieve this bank account at a later date
    Balanced::BankAccount.find(ba.uri)

    # delete this bank account
    ba.unstore


### Debit a Bank Account

    require 'balanced_ach'

    # debit this bank account $1.00 USD
    Balanced::Debit.new(
	:bank_account => {
            :name => "Gottfried Leibniz",
	    :account_number => "3819372930",
            :routing_number => "121042882",
	    :type => "checking"
	}, :amount => 100
    ).save

### Credit a Bank Account

    require 'balanced_ach'

    # credit this bank account $1.00 USD
    Balanced::Credit.new(
        :bank_account => {
            :name => "Gottfried Leibniz",
            :account_number => "3819372930",
            :routing_number => "121042882",
	        :type => "checking"
        }, :amount => 100
    ).save




