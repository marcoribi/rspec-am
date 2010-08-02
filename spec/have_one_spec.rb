require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

# Fake-Data only for testing
require 'fake_data'

describe HaveOne do
  before(:each) do
    @actual_model = mock('ActualModel')
    @actual_model.stub!(:class).and_return(Album)
    @expected_model = :description
    @belong_to = HaveOne.new(@expected_model)
  end
  
  it "should set expected_model" do
    @belong_to.expected_model.should  be_eql(@expected_model)
  end
  
  it "should match with a AR model and a belongs_to association" do
    @actual_model.stub!(:is_a?).with(ActiveRecord::Base).and_return(true)
    FakeAssociationReflection.stub!(:name).and_return(:has_one)
    Album.stub!(:reflect_on_all_associations).and_return([FakeAssociationReflection.new(@expected_model)])
    
    @belong_to.matches?(@actual_model).name.should == :description
  end
  
  it "should not match a none AR model" do
    @actual_model.stub!(:is_a?).with(ActiveRecord::Base).and_return(false)
    @belong_to.matches?(@actual_model).should be_nil
  end
end