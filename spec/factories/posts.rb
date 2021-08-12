# frozen_string_literal: true

FactoryBot.define do
  factory :post do
    title { 'MyString' }
    content { 'MyText' }
    tags { 'TagName1,TagName2' }
  end
end
