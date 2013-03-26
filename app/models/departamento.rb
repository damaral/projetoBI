class Departamento < ActiveRecord::Base
  attr_accessible :nome

  has_many :fato_rh_quantidade_funcionarios
  has_many :fato_financeiro_despesas
end
