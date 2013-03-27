class FatoFinanceiroDespesas < ActiveRecord::Base
  attr_accessible :custo_infraestrutura, :custo_outros, :custo_treinamento, :despesa_total, :salario_total

  belongs_to :calendario_mes
  belongs_to :departamento
end
