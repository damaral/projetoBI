class HistoricoFuncionario < ActiveRecord::Base
  attr_accessible :cargo_antigo, :cargo_novo, :salario_antigo, :salario_novo
end
