class LanguageLevel < ActiveEnum::Base
  value :id => 1, :name => :beginner
  value :id => 2, :name => :elementary
  value :id => 3, :name => :pre_intermediate
  value :id => 4, :name => :intermediate
  value :id => 5, :name => :upper_intermediate
  value :id => 6, :name => :advanced
  value :id => 7, :name => :proficiency
end
