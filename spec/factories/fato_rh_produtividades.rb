# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :fato_rh_produtividade do
    receita_total 1.5
    num_estagiarios 1
    num_funcionarios 1
    produtividade_total 1.5
    produtividade_real 1.5
  end
end
