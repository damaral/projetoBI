# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :fato_financeiro_despesa, :class => 'FatoFinanceiroDespesa' do
    despesa_total 1.5
    salario_total 1.5
    custo_infraestrutura 1.5
    custo_treinamento 1.5
    custo_outros 1.5
  end
end
