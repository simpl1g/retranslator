class FileType < ActiveEnum::Base
  value :id => 0, :name => :file
  value :id => 1, :name => :folder
end
