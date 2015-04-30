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

describe ActiveSupport::Inflector do
  it "provides useful methods to \'String\' class" do
    expect( "ActiveSupport".underscore ).to eq( "active_support" )
    expect( "active_support".camelize ).to eq( "ActiveSupport" )

    expect( "active_support".singularize ).to eq( "active_support" )
    expect( "active_supports".singularize ).to eq( "active_support" )
    expect( "active_support".pluralize ).to eq( "active_supports" )
    expect( "active_supports".pluralize ).to eq( "active_supports" )

    expect( "active_support".classify ).to eq( "ActiveSupport" )
    expect( "active_support".dasherize ).to eq( "active-support" )
    expect( "ActiveSupport".tableize ).to eq( "active_supports" )
    expect( "active_support".titleize ).to eq( "Active Support" )
    expect( "active_support".titlecase ).to eq( "Active Support" )

    expect( "ActiveSupport".constantize ).to eq( ActiveSupport )
    expect( "ActiveSupport::Concern".constantize ).to eq( ActiveSupport::Concern )

    expect( "ActiveSupport".deconstantize ).to eq( "" )
    expect( "::ActiveSupport".deconstantize ).to eq( "" )
    expect( "ActiveSupport::Concern".deconstantize ).to eq( "ActiveSupport" )
    expect( "::ActiveSupport::Concern".deconstantize ).to eq( "::ActiveSupport" )

    expect( "ActiveSupport".demodulize ).to eq( "ActiveSupport" )
    expect( "ActiveSupport::Concern".demodulize ).to eq( "Concern" )
    expect( "".demodulize ).to eq( "" )

    expect( "ActiveSupport".foreign_key ).to eq( "active_support_id" )
    expect( "ActiveSupport".foreign_key( false ) ).to eq( "active_supportid" )
    expect( "ActiveSupport::Concern".foreign_key ).to eq( "concern_id" )
    expect( "ActiveSupport::Concern".foreign_key( false ) ).to eq( "concernid" )

    expect( "active_record".humanize ).to eq( "Active record" )
    expect( "active_record".humanize( capitalize: false ) ).to eq( "active record" )
    expect( "record_id".humanize ).to eq( "Record" )
    expect( "record_id".humanize( capitalize: false ) ).to eq( "record" )
    expect( "_id".humanize ).to eq( "Id" )
    expect( "_id".humanize( capitalize: false ) ).to eq( "id" )

    expect( "Donald E. Knuth".parameterize ).to eq( "donald-e-knuth" )
    expect( "Kokkai gijidomae".parameterize( "_" ) ).to eq( "kokkai_gijidomae" )

  end
end

describe PositiveSymbolSupport::SymbolExt do
  it "provides useful methods to \'Symbol\' class" do
    expect( :ActiveSupport.underscore ).to eq( :active_support )
    expect( :active_support.camelize ).to eq( :ActiveSupport )
    expect( :active_supports.singularize ).to eq( :active_support )
    expect( :active_support.singularize ).to eq( :active_support )
    expect( :active_support.pluralize ).to eq( :active_supports )
    expect( :active_supports.pluralize ).to eq( :active_supports )

    expect( :active_support.classify ).to eq( :ActiveSupport )
    expect( :active_support.dasherize ).to eq( :"active-support" )
    expect( :ActiveSupport.tableize ).to eq( :active_supports )
    expect( :active_support.titleize ).to eq( :"Active Support" )
    expect( :active_support.titlecase ).to eq( :"Active Support" )

    expect( :ActiveSupport.constantize ).to eq( :ActiveSupport )
    expect( :"ActiveSupport::Concern".constantize ).to eq( :"ActiveSupport::Concern" )

    expect( :ActiveSupport.deconstantize ).to eq( nil )
    expect( :"::ActiveSupport".deconstantize ).to eq( nil )
    expect( :"ActiveSupport::Concern".deconstantize ).to eq( :ActiveSupport )
    expect( :"::ActiveSupport::Concern".deconstantize ).to eq( :"::ActiveSupport" )

    expect( :ActiveSupport.demodulize ).to eq( :ActiveSupport )
    expect( :"ActiveSupport::Concern".demodulize ).to eq( :Concern )
    expect( :"".demodulize ).to eq( nil )

    expect( :ActiveSupport.foreign_key ).to eq( :active_support_id )
    expect( :ActiveSupport.foreign_key( false ) ).to eq( :active_supportid )
    expect( :"ActiveSupport::Concern".foreign_key ).to eq( :concern_id )
    expect( :"ActiveSupport::Concern".foreign_key( false ) ).to eq( :concernid )

    expect( :active_record.humanize ).to eq( :"Active record" )
    expect( :active_record.humanize( capitalize: false ) ).to eq( :"active record" )
    expect( :record_id.humanize ).to eq( :Record )
    expect( :record_id.humanize( capitalize: false ) ).to eq( :record )
    expect( :_id.humanize ).to eq( :Id )
    expect( :_id.humanize( capitalize: false ) ).to eq( :id )

    expect( :"Donald E. Knuth".parameterize ).to eq( :"donald-e-knuth" )
    expect( :"Kokkai gijidomae".parameterize( "_" ) ).to eq( :kokkai_gijidomae )

  end
end
