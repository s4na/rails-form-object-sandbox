# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /posts' do
    it do
      get posts_path
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /posts/:id' do
    it do
      post = create(:post)
      get post_path(post)
      expect(response).to have_http_status(200)
      expect(post.reload).to be_present
    end
  end

  describe 'GET /posts/new' do
    it do
      get new_post_path, params: { post: { title: '日記4', content: '赤リンゴ青リンゴ' } }
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /posts/:id/edit' do
    it do
      post = create(:post)
      get edit_post_path(post)
      expect(response).to have_http_status(200)
      expect(post.reload).to be_present
    end
  end

  describe 'POST /posts' do
    it do
      post posts_path, params: { post: { title: '日記2', content: '夕焼け小焼け' } }

      expect(response).to have_http_status(302)
      post = Post.find_by(title: '日記2')
      expect(post).to be_present
      expect(post.title).to eq '日記2'
    end
  end

  describe 'PATCH /posts/:id' do
    it do
      post = create(:post)
      patch post_path(post), params: { post: { title: '日記3', content: 'ぬぬぬぬぬぬ' } }

      expect(response).to have_http_status(302)
      expect(post.reload).to be_present
      expect(post.title).to eq '日記3'
    end
  end

  describe 'DELETE /posts/:id' do
    it do
      post = create(:post)
      delete post_path(post)
      expect(response).to have_http_status(302)
      expect{ post.reload }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end
end
