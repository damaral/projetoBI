#coding: utf-8

class CalendarioMes < ActiveRecord::Base
  attr_accessible :ano, :mes, :mmyyyy

  has_one :fato_crm_kpi
  has_many :fato_crm_sacs
  has_one :fato_rh_produtividade
  has_many :fato_rh_quantidade_funcionarios
  has_one :fato_financeiro_demonstrativo
  has_many :fato_financeiro_despesas

  MESES = {
    "01" => "Janeiro",
    "02" => "Fevereiro",
    "03" => "Março",
    "04" => "Abril",    
    "05" => "Maio",
    "06" => "Junho",
    "07" => "Julho",
    "08" => "Agosto",
    "09" => "Setembro",
    "10" => "Outubro",
    "11" => "Novembro",
    "12" => "Dezembro"
  }

end
