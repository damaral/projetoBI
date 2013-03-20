class CalendarioMes < ActiveRecord::Base
  attr_accessible :ano, :mes, :mmyyyy

  has_one :fato_rh_produtividade 
  has_one :fato_crm_kpi

  has_many :fato_crm_sacs
end
