# Rspec-am

Rspec-am is a simple extension of Rspec 2.0 (beta) and provides some useful association matchers. It's tested for Rails 3.0 and Rspec 2.

## Usage

describe User do

  it { should have_many(:books) }
  
  it { should have_one(:boss) }
  
  it { should belong_to(:business) }
  
end

    

    
## Copyright
Copyright (c) 2010 SoftwareLab. See LICENSE for details.
