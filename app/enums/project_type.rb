class ProjectType < ActiveEnum::Base
  value :id => 1, :name => :public
  value :id => 2, :name => :private
end
