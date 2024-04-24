# ECR, ECS
- 以下参考にした
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

### aws_iam_policy_document
- IAMポリシーのJSONと対応
- https://atsum.in/terraform/aws-iam-policy-document/

### aws_iam_role
- ロール作成

### aws_iam_role_policy_attachment
- ポリシーをロールにアタッチする

### aws_cloudwatch_log_group
- retention_in_days
  - optionalな引数
  - ログを保持する最大日数を指定できる

### aws_lb_target_group
- https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_target_group
- deregistratioin_delay
  - targetの老徳が解除されたときにload balancerが待つ時間を指定
- target_typeでは以下などを指定できる
  - "ip" : IP Target Group
  - "lambda" : Lambda Target Group
  - "alb" : ALB Target Group

### aws_lb
- https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb
- Elastic Load Balancer
  - aws_elbは従来のElastic Load Balancer(Classic Load Balancer)
  - 今のELBは従来のELBにALBの機能も加えたようなもの？？？
  - ALBはレイヤー7だけで機能するロードバランサー
    - レイヤー7 : アプリケーション層(OSI参照モデル)
    - 名前の通りアプリケーション層に特化している
- subnetやsecurity_groupなどを指定する

### aws_lb_listener
- https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener
- リスナーの作成
- どのプロトコルでどのポートでのアクセスを受け付けるかという話

### template_file
- fileをオープンする際にファイル内で使用している環境編巣にvariableの値を代入できる