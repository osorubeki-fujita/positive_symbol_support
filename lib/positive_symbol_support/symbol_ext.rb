module PositiveSymbolSupport::SymbolExt

  [ :underscore , :camelize , :singularize , :pluralize ].each do | method_name |
    eval <<-DEF
      def #{method_name.to_s}
        self.to_s.#{method_name.to_s}.to_sym
      end
    DEF
  end

end
