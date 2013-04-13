class FatoPortalCursoEmpresaMensal < ActiveRecord::Base
  attr_accessible :fracao_estagiarios

  belongs_to :calendario_mes
  belongs_to :empresa
  belongs_to :curso
end
