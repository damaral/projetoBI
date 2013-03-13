# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :fato_crm_kpi do
    receita_adquirida 1.5
    clientes_adquiridos 1
    cac 1.5
    despesas_marketing 1.5
    roi 1.5
    numero_de_campanhas 1
    receita_por_campanha 1.5
  end
end
