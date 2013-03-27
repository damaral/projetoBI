class CalendarioMes < ActiveRecord::Base
  attr_accessible :ano, :mes, :mmyyyy

  has_one :fato_crm_kpi
  has_many :fato_crm_sacs
  has_one :fato_rh_produtividade
  has_many :fato_rh_quantidade_funcionarios
  has_one :fato_financeiro_demonstrativo
  has_many :fato_financeiro_despesas

end
