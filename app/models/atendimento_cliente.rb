class AtendimentoCliente < ActiveRecord::Base
  attr_accessible :mensagem_enviada, :mensagem_recebida
end
