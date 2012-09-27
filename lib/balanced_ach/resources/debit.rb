module Balanced
  # A Debit represents a transfer of funds from a buyer's Account to your
  # Marketplace's escrow account.
  #
  # A Debit may be created directly, or it will be created as a side-effect
  # of capturing a Hold. If you create a Debit directly it will implicitly
  # create the associated Hold if the funding source supports this.
  #
  # If no Hold is specified the Debit will by default be created using the
  # most recently added funding source associated with the Account. You
  # cannot change the funding source between creating a Hold and capturing
  # it.
  #
  class Debit
    include Balanced::Resource

    def initialize attributes = {}
      Balanced::Utils.stringify_keys! attributes
      unless attributes.has_key? 'uri'
        attributes['uri'] = self.class.uri
      end
      super attributes
    end

  end
end

