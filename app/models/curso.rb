class Curso < ActiveRecord::Base
  attr_accessible :faculdade, :nome

  has_many :fato_portal_curso_mensals
  has_many :fato_portal_curso_empresa_mensals
end
