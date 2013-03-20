class FatoSuporteChamadosDepartamento < ActiveRecord::Base
  attr_accessible :num_chamados

  belongs_to :calendario_mes
  belongs_to :departamento
  belongs_to :tipo_chamado
end
