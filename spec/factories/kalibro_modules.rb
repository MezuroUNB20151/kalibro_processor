FactoryGirl.define do
  factory :kalibro_module do
    granularity { FactoryGirl.build(:granularity) }
    name { ['home', 'user', 'project'] }

    trait :with_id do
      id 51
    end

    trait :with_granularity_software do
      granularity { FactoryGirl.build(:software_granularity) }
    end

    trait :with_granularity_class do
      granularity { FactoryGirl.build(:class_granularity) }
    end

    trait :with_granularity_method do
      granularity { FactoryGirl.build(:method_granularity) }
    end

    factory :kalibro_module_with_software_granularity, traits: [:with_granularity_software]
    factory :kalibro_module_with_class_granularity, traits: [:with_granularity_class]
    factory :kalibro_module_with_method_granularity, traits: [:with_granularity_method]

    initialize_with { KalibroModule.new({granularity: granularity, name: name}) }

    factory :kalibro_module_with_id, traits: [:with_id]
  end
end
