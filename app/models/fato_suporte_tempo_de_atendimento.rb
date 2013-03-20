class FatoSuporteTempoDeAtendimento < ActiveRecord::Base
  attr_accessible :num_chamados_estourados, :tempo_medio_atendimento

  belongs_to :calendario_mes
  belongs_to :departamento
  belongs_to :tipo_chamado
end
