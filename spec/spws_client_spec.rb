$: << File.dirname(__FILE__)
require 'spec_helper'

describe 'Test the Sharepoint List web service functionality' do
  before(:all) do
    @scli = Viewpoint::SPWSClient.new(@conf[:site], @conf[:user], @conf[:pass])
  end

  it 'should retrieve the Lists from a given Sharepoint site' do
    lists = @scli.get_lists
    lists.should be_an_instance_of(Array)
    lists.first.should be_a_kind_of(Viewpoint::SPWS::Types::List)
  end

  it 'should retrieve the Items from a given List' do
    lists = @scli.get_lists
    items = lists.first.items
    items.should be_an_instance_of(Array)
  end

end