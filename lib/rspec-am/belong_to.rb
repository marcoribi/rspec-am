class BelongTo
  attr_reader :expected_model
  
  def initialize(expected_model)
    @expected_model = expected_model
  end
  
  def matches?(actual_model)
    @actual_model = actual_model
    model = actual_model.class if actual_model.is_a? ActiveRecord::Base
    model.reflect_on_all_associations(:belongs_to).find { |a| a.name == @expected_model } if model
  end
  
  def failure_message_for_should
    "expected a belongs to association from #{@actual_model} to #{@expected_model}"
  end
  
end

def belong_to(expected_model)
  BelongTo.new(expected_model)
end