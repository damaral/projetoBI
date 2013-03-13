class FatoPortalEmpresaMensal < ActiveRecord::Base
  attr_accessible :num_contratacoes, :num_demissoes_involuntarias, :num_demissoes_voluntarias, :num_estagiarios, :num_medio_dias_contratacao, :num_vagas
end
