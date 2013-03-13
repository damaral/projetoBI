# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :fato_suporte_tempo_de_atendimento do
    tempo_medio_atendimento 1.5
    num_chamados_estourados 1
  end
end
