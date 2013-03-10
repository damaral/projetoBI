class Funcionario < ActiveRecord::Base
  attr_accessible :cargo_atual, :motivo_demissao, :nome

  belongs_to :data_admissao, class_name: "Calendario", foreign_key: "data_admissao_id"
  belongs_to :data_demissao, class_name: "Calendario", foreign_key: "data_demissao_id"
end
