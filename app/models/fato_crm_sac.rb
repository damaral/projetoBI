class FatoCrmSac < ActiveRecord::Base
  attr_accessible :tempo_medio_atendimento, :total_email_recebidos, :total_emails_respondidos
  	
  belongs_to :calendario_mes
  belongs_to :motivo
end
