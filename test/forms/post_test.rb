# frozen_string_literal: true

require 'test_helper'

class PostTest < ActiveSupport::TestCase
  test '#new' do
    post_form = PostForm.new({ title: '日記1', content: 'あめんぼ青いなあいうえお' })

    assert_equal post_form.title, '日記1'
    assert_equal post_form.content, 'あめんぼ青いなあいうえお'
  end

  test '#save' do
    post_form = PostForm.new({ title: '日記1', content: 'あめんぼ青いなあいうえお' })
    post_form.save

    assert_equal post_form.title, '日記1'
    assert_equal post_form.content, 'あめんぼ青いなあいうえお'
  end

  test '#to_model' do
    post_form = PostForm.new
    assert_equal post_form.to_model.class, Post
  end
end
