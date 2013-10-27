# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :vendor_answer do
    questionairre_item_id 1
    questionairre_date "2013-10-24"
    vendor_id 1
    answer "MyText"
  end
end
