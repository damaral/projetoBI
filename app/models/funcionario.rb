class Funcionario < ActiveRecord::Base
  attr_accessible :cargo_atual, :motivo_demissao, :nome
end
