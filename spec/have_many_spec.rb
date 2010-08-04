require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

# A AR-Fakeclass for testing
require 'fake_data'

describe HaveMany do
  before(:each) do
    @actual_model = mock('ActualModel')
    @actual_model.stub!(:class).and_return(Album)
    @expected_model = :pictures
    @have_many = HaveMany.new(@expected_model)
  end
  
  it "should set expected_model" do
    @have_many.expected_model.should  be_eql(@expected_model)
  end
  
  it "should match with a AR model and a belongs_to association" do
    @actual_model.stub!(:is_a?).with(ActiveRecord::Base).and_return(true)
    @have_many.matches?(@actual_model).name.should == :pictures
  end
  
  it "should not match a none AR model" do
    @have_many.matches?(mock('NoneAR')).should be_nil
  end
end