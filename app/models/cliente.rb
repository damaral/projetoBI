class Cliente < ActiveRecord::Base
  attr_accessible :cnpj, :email, :nome, :tipo_cliente
end
