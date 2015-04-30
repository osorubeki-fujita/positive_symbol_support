require 'spec_helper'
require 'deplo'

spec_filename = ::File.expand_path( ::File.dirname( __FILE__ ) )
version = "0.1.0"

describe PositiveSymbolSupport do
  it "has a version number \'#{ version }\'" do
    expect( ::PositiveSymbolSupport::VERSION ).to eq( version )
    expect( ::Deplo.version_check( ::PositiveSymbolSupport::VERSION , spec_filename ) ).to eq( true )
  end
end
