class CalendarioMes < ActiveRecord::Base
  attr_accessible :ano, :mes, :mmyyyy

  has_one :fato_rh_produtividade
  has_many :fato_rh_quantidade_funcionarios
end
