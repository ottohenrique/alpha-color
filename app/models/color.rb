class Color < ActiveRecord::Base
  validates_presence_of :hex
  validates_length_of :hex, is: 6
end
