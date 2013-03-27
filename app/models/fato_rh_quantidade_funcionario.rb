class FatoRhQuantidadeFuncionario < ActiveRecord::Base
  attr_accessible :orcamento_disponivel, :orcamento_previsto, :quantidade_funcionarios, :salario_total

  belongs_to :calendario_mes
  belongs_to :departamento

end
