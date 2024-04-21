# ECR, ECS
- 以下参考
  - https://qiita.com/Shoma0210/items/b998a260c5d18839fb7a


## 構造

## 説明

## メモ
### aws_ecr_repository
- image_tag_mutability
  - "MUTABLE"か"IMMUTABLE"のどちらか
  - defaultは"MUTABLE"
  - イメージタグを変更可能にするか不可能にするかということ
- image_scanning_configuration
  - コンテナイメージのセキュリティ診断を行ってくれるというもの

### null_resource
- 何のリソースも作らないもの
- terraform apply時にコマンドを実行させたいときにつかえる

### path.module
- そのモジュールまでのpathを得られる
- https://www.guri2o1667.work/entry/2023/04/20/%E3%80%90Terraform%E3%80%91%EF%BC%88%E5%88%9D%E5%BF%83%E8%80%85%E5%90%91%E3%81%91%EF%BC%89path.module%E3%81%A8path.root%E3%81%AB%E3%81%A4%E3%81%84%E3%81%A6