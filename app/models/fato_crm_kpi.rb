class FatoCrmKpi < ActiveRecord::Base
  attr_accessible :cac, :clientes_adquiridos, :despesas_marketing, :numero_de_campanhas, :receita_adquirida, :receita_por_campanha, :roi

    belongs_to :calendario_mes
end
