# Symbol に機能を追加するためのモジュール
# @see http://api.rubyonrails.org/classes/ActiveSupport/Inflector.html
module PositiveSymbolSupport::SymbolExt

  [ :underscore , :camelize , :singularize , :pluralize ,
    :classify , :dasherize ,
    :tableize , :titleize , :titlecase
  ].each do | method_name |
    eval <<-DEF
      def #{method_name.to_s}
        self.to_s.#{method_name.to_s}.to_sym
      end
    DEF
  end

  def constantize
    self
  end

  [ :deconstantize , :demodulize ].each do | instance_method_name |
    eval <<-DEF
      def #{instance_method_name}
        str = to_s.send( __method__ )
        if str.blank?
          nil
        else
          str.to_sym
        end
      end
    DEF
  end

  def foreign_key( separate_class_name_and_id_with_underscore = true )
    to_s.send( __method__ , separate_class_name_and_id_with_underscore ).to_sym
  end

  def humanize( options = {} )
    to_s.send( __method__ , options ).to_sym
  end

  def parameterize( sep = "-" )
    to_s.send( __method__ , sep ).to_sym
  end

end
