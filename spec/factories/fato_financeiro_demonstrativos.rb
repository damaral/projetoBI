# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :fato_financeiro_demonstrativo do
    receita_total 1.5
    custos_variaveis 1.5
    custos_fixos 1.5
    impostos 1.5
    lucro 1.5
  end
end
