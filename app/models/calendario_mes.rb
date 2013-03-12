class CalendarioMes < ActiveRecord::Base
  attr_accessible :ano, :mes, :mmyyyy

  has_one :fato_rh_produtividade
end
