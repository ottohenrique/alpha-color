class Vote < ActiveRecord::Base
  belongs_to :word
  belongs_to :coloer
end
