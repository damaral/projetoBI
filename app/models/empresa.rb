class Empresa < ActiveRecord::Base
  attr_accessible :nome

  has_many :fato_portal_empresa_mensals
  has_many :fato_portal_empresa_anuals
  has_many :fato_portal_curso_empresa_mensals
end
