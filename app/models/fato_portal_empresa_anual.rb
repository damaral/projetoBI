class FatoPortalEmpresaAnual < ActiveRecord::Base
  attr_accessible :salario_medio

  belongs_to :calendario_mes
  belongs_to :empresa
end
