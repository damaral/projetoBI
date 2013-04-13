class TipoChamado < ActiveRecord::Base
  attr_accessible :nome

  has_many :fato_suporte_chamados_departamento
  has_many :fato_suporte_tempo_de_atendimento
end
