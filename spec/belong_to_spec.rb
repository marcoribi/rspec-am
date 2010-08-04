require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

# A AR-Fakeclass for testing
require 'fake_data'

describe BelongTo do
  before(:each) do
    @actual_model = mock('ActualModel')
    @actual_model.stub!(:class).and_return(Album)
    @expected_model = :user
    @belong_to = BelongTo.new(@expected_model)
  end
  
  it "should set expected_model" do
    @belong_to.expected_model.should  be_eql(@expected_model)
  end
  
  it "should match with a AR model and a belongs_to association" do
    @actual_model.stub!(:is_a?).with(ActiveRecord::Base).and_return(true)    
    @belong_to.matches?(@actual_model).name.should == :user
  end
  
  it "should not match a none AR model" do
    @belong_to.matches?(mock('NoneAR')).should be_nil
  end
end
