class Motivo < ActiveRecord::Base
  attr_accessible :descricao, :nome

   has_many :fato_crm_sacs
end
