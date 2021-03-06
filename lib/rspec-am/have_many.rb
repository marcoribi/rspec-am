class HaveMany   
  attr_reader :expected_model
   
  def initialize(expected_model)
    @expected_model = expected_model
  end
  
  def matches?(actual_model)
    @actual_model = actual_model
    model = actual_model.class if actual_model.is_a? ActiveRecord::Base
    model.reflect_on_all_associations(:has_many).find { |a| a.name == @expected_model } if model
  end
  
  def failure_message_for_should
    "expected a #{@actual_model.class} has many #{@expected_model}"
  end
  
end

def have_many(expected_model)
  HaveMany.new(expected_model)
end