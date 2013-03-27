class FatoFinanceiroDemonstrativo < ActiveRecord::Base
  attr_accessible :custos_fixos, :custos_variaveis, :impostos, :lucro, :receita_total

  belongs_to :calendario_mes
end
