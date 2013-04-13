class FatoPortalCursoMensal < ActiveRecord::Base
  attr_accessible :num_estagiario_ativos, :num_estagiarios_contratados, :taxa_de_aceitacao_contrado

  belongs_to :calendario_mes
  belongs_to :curso
end
