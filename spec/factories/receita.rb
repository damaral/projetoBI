# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :receita do
    sequence(:valor) {|n| 27.69*n.next }
    
  end
end