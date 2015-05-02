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