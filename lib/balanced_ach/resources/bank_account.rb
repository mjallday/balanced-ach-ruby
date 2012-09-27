module Balanced
  class BankAccount
    include Balanced::Resource

    def initialize attributes = {}
      Balanced::Utils.stringify_keys! attributes
      unless attributes.has_key? 'uri'
        attributes['uri'] = self.class.uri
      end
      super attributes
    end

    def debit params
      amount = params.fetch(:amount) {nil}
      if amount.nil?
        raise "amount is required"
      end
      response = Balanced.post(self.debits_uri, :amount => amount)
      self.class.construct_from_response response.body
    end

    def credit params
      amount = params.fetch(:amount) {nil}
      if amount.nil?
        raise "amount is required"
      end
      response = Balanced.post(self.credits_uri, :amount => amount)
      self.class.construct_from_response response.body
    end

    def unstore
      Balanced.delete(self.uri)
    end

  end
end
