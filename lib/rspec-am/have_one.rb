class HaveOne    
  def initialize(expected_model)
    @expected_model = expected_model
  end
  
  def matches?(actual_model)
    @actual_model = actual_model
    model = actual_model.class if actual_model.is_a? ActiveRecord::Base
    model.reflect_on_all_associations(:have_one).find { |a| a.name == @expected_model }
  end
  
  def failure_message_for_should
    "expected a #{@actual_model.class} has exactly one #{@expected_model}"
  end
  
end

def have_one(expected_model)
  HaveOne.new(expected_model)
end