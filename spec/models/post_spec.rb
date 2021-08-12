require 'rails_helper'

RSpec.describe Post, type: :model do
  describe '#new' do
    it do
      category = create(:category)
      post = create(:post, category_id: category.id)

      expect(category).to be_present
      expect(post).to be_present
    end
  end
end
