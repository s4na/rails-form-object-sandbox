# frozen_string_literal: true

FactoryBot.define do
  factory :post do
    title { 'PostName' }
    content { 'PostTitle' }
    category_id { nil }
  end
end
