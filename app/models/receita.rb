class Receita < ActiveRecord::Base
  attr_accessible :valor

  belongs_to :calendario
end
