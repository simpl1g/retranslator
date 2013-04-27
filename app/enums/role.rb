class Role < ActiveEnum::Base
  value :id => 1, :name => :admin
  value :id => 2, :name => :translator
end
