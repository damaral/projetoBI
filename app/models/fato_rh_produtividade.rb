class FatoRhProdutividade < ActiveRecord::Base
  attr_accessible :num_estagiarios, :num_funcionarios, :produtividade_real, :produtividade_total, :receita_toal

  belongs_to :calendario_mes
end
