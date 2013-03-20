class CalendarioMes < ActiveRecord::Base
  attr_accessible :ano, :mes, :mmyyyy

  has_one :fato_rh_produtividade
  has_one :fato_financeiro_demonstrativo
  has_many :fato_financeiro_despesas
end
