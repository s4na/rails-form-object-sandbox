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
    it do
      post_form = PostForm.new({ title: '日記1', content: 'あめんぼ青いなあいうえお' })
      post_form.save

      expect(post_form.title).to eq '日記1'
      expect(post_form.content).to eq 'あめんぼ青いなあいうえお'
    end
  end

  describe '#to_model' do
    it do
      post_form = PostForm.new
      expect(post_form.to_model.class).to eq Post
    end
  end
end
