class Departamento < ActiveRecord::Base
  attr_accessible :nome

  has_many :fato_rh_quantidade_funcionarios
  has_many :fato_financeiro_despesas
  has_many :fato_suporte_chamados_departamento
  has_many :fato_suporte_tempo_de_atendimento
end
