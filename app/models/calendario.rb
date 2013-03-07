class Calendario < ActiveRecord::Base
  attr_accessible :ano, :ddmmyyyy, :dia, :dia_ano, :dia_semana, :mes, :mmyyyy, :semana_ano
end
