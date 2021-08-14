# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Posts', type: :system do
  before do
    driven_by(:rack_test)
  end

  describe '投稿の追加' do
    it do
      visit posts_path
      click_on 'New Post'
      fill_in 'post_title', with: '日記5'
      fill_in 'post_content', with: 'あめんぼ赤いなあいうえお'
      click_on 'Create Post'

      expect(page).to have_current_path(posts_path, url: false)
      expect(page).to have_content('日記5')
      expect(page).to have_content('あめんぼ赤いなあいうえお')
    end
  end

  describe '投稿の編集' do
    it do
      post = create(:post)

      visit posts_path
      click_on 'Edit'
      fill_in 'post_title', with: '日記6'
      fill_in 'post_content', with: '肩凝った'
      click_on 'Update Post'

      expect(page).to have_current_path(posts_path, url: true)
      expect(page).to have_no_content('日記6')
      expect(page).to have_no_content('肩凝った')
    end
  end

  describe '投稿の削除' do
    it do
      post = create(:post)

      visit posts_path
      click_on 'Destroy'

      expect(page).to have_current_path(posts_path, url: true)
      expect(page).to have_no_content(post.title)
      expect(page).to have_no_content(post.content)
      expect { post.reload }.raise_error(ActiveRecord::RecordNotFound)
    end
  end
end
