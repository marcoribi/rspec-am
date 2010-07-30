require File.expand_path(File.dirname(__FILE__) + '/spec_helper')



describe BelongTo do
  before(:each) do
    @expected_model = :user
    @belong_to = BelongTo.new(@expected_model)
  end
  
  it "should set expected_model" do
    @belong_to.expected_model.should  be_eql(@expected_model)
  end
  

end
