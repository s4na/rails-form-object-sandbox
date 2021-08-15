# Rails Form Object Sandbox

`Form.new.save.update` 可能なForm Objectを作成する。

## セットアップ

```
./bin/setup
```

## サーバー起動

```
./bin/webpack-dev-server
```

別ターミナルで

```
./bin/rails s
```

## テスト

```
./bin/bundle exec rspec
```

ex)

```
./bin/bundle exec rspec spec/models/post_spec.rb
```

## 参考

- [Railsのデザインパターン: Formオブジェクト - applis](https://applis.io/posts/rails-design-pattern-form-objects)
- [Rails: Form Objectと`#to_model`を使ってバリデーションをモデルから分離する（翻訳）](https://techracho.bpsinc.jp/hachi8833/2018_03_02/51350)
- [form_withがPOSTとPATCHを切り替える条件](https://qiita.com/okonomi/items/6c2b31427161090c173a)
- [form objectを使ってみよう](https://tech.medpeer.co.jp/entry/2017/05/09/070758)
