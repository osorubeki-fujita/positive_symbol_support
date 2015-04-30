require "positive_symbol_support/version"

require "active_support"
require "active_support/core_ext"

require_relative "positive_symbol_support/symbol_ext"

module PositiveSymbolSupport

  extend ::ActiveSupport::Concern

  included do

    ::Symbol.class_eval do
      include ::PositiveSymbolSupport::SymbolExt
    end

  end

end

include PositiveSymbolSupport
