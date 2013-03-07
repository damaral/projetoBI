# Be sure to restart your server when you modify this file.

# Add new inflection rules using the following format
# (all these examples are active by default):
# ActiveSupport::Inflector.inflections do |inflect|
#   inflect.plural /^(ox)$/i, '\1en'
#   inflect.singular /^(ox)en/i, '\1'
#   inflect.irregular 'person', 'people'
#   inflect.uncountable %w( fish sheep )
# end
#
# These inflection rules are supported but not enabled by default:
# ActiveSupport::Inflector.inflections do |inflect|
#   inflect.acronym 'RESTful'
# end


ActiveSupport::Inflector.inflections do |inflect|
  #inflect.plural /^(ox)$/i, '\1en'
  #inflect.singular /^(ox)en/i, '\1'
  inflect.irregular 'departamento', 'departamentos'
  inflect.irregular 'historico_departamento', 'historico_departamentos'
  inflect.irregular 'funcionario', 'funcionarios'
  inflect.irregular 'historico_funcionario', 'historico_funcionarios'
  inflect.irregular 'despesa', 'despesas'
  inflect.irregular 'receita', 'receitas'
  inflect.irregular 'chamado', 'chamados'
  inflect.irregular 'patrimonio', 'patrimonios'
  inflect.irregular 'campanha', 'campanhas'
  inflect.irregular 'atendimento_cliente', 'atendimentos_cliente'
  inflect.irregular 'cliente', 'clientes'
  inflect.irregular 'estagio', 'estagios'
  inflect.irregular 'estagiario', 'estagiarios'
  inflect.irregular 'processo_seletivo', 'processos_seletivos'
  inflect.irregular 'vaga', 'vagas'
  inflect.irregular 'data', 'datas'
  #inflect.uncountable %w( fish sheep )
end