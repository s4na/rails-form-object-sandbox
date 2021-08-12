# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Post, type: :form do
  describe '#new' do
    it do
      post_form = PostForm.new({ title: '日記1', content: 'あめんぼ青いなあいうえお' })

      expect(post_form.title).to eq '日記1'
      expect(post_form.content).to eq 'あめんぼ青いなあいうえお'
    end
  end

  describe '#save' do
    context '新規作成時' do
      it do
        post_form = PostForm.new({ title: '日記1', content: 'あめんぼ青いなあいうえお' })
        post_form.save

        expect(post_form.title).to eq '日記1'
        expect(post_form.content).to eq 'あめんぼ青いなあいうえお'
      end
    end

    context '更新時' do
      let!(:post) { Post.new({ title: '日記1', content: 'あめんぼ青いなあいうえお' }) }

      before do
        post.save
      end

      it do
        post_form = PostForm.new(post, { title: '日記2', content: '腹減った' })
        post_form.save

        expect(post_form.title).to eq '日記2'
        expect(post_form.content).to eq '腹減った'
      end
    end
  end

  describe '#to_model' do
    it do
      post_form = PostForm.new
      expect(post_form.to_model.class).to eq Post
    end
  end
end
