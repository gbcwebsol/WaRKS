FactoryGirl.define do
  factory :department do
    sequence(:name) do |n|
      "department_#{n}" 
    end
  end
  
  factory :section do
    sequence(:name) do |n|
      "section_#{n}" 
    end
  end
  
  factory :guest_free, :class => :guest do
    sequence(:uid) do |n|
      "uid_#{n}" 
    end
  end
  
  factory :guest do
    department
    sequence(:uid) do |n|
      "uid_#{n}" 
    end
  end
end

