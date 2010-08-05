# Rspec-am

Rspec-am is a simple extension of Rspec 2.0 (beta) and provides some useful association matchers like belong_to, have_many and have_one (see usage). It's tested for Rails 3.0 and Rspec 2.

Gem is developed for rails (version: 3.0.0.beta4), rspec (version: 2.0.0.beta.14) and rspec-rails (version: 2.0.0.beta.17)

## Usage

describe User do

  it { should have_many(:books) }
  
  it { should have_one(:boss) }
  
  it { should belong_to(:business) }
  
end

    

    
## Copyright
Copyright (c) 2010 SoftwareLab (software-lab.ch). See LICENSE for details.
