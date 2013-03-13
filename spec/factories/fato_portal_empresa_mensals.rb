# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :fato_portal_empresa_mensal do
    num_vagas 1
    num_contratacoes 1
    num_estagiarios 1
    num_medio_dias_contratacao 1.5
    num_demissoes_voluntarias 1
    num_demissoes_involuntarias 1
  end
end
