# README

### ++Yourtuber++
![Yourtuber](https://user-images.githubusercontent.com/61099443/103450124-0769ba00-4cf5-11eb-81ee-893d98fb0705.gif)


[Yourtuberへのリンク](https://www.yourtuber.net)

### ++AWS構成図++
![AWS構成図](https://i.imgur.com/mauYNH2.png)


### ++開発環境++
* Ruby
* Ruby on  rails
* Docker
* Docker-compose
* AWS
    1. ECR
    2. ECS
    3. ELB
    4. RDS
    5. ROUTE53
    6. Certificate Manager
    7. IAM
* Nginx
* Puma
* Github
* Editor
    1. VSCode
* Shell Script

### ++こだわり++
* 常時SSL化
    デプロイ時にクラウド環境であるAWSを用い、またELBを使用して常時SSL化を行いました。
* WEB API機能
    本ポートフォリオではGoogle APIを使用し検索を行えるようになっています。
* VCR gem導入
    Google APIを使用している性質上、テストを行う際に何度もリクエストを飛ばしてしまいコストがかかってしまいます。
    そこで本ポートフォリオでは、VCR gemを用いて一度行ったリクエストの結果を保存することでテスト中のコストを抑えるように設計しております。

### ++今後の課題++
* セキュリティ面での不安
    バックエンド側でCSRF対策を行なっていますが、それだけで十分に対策ができているのか分からないのが現状です。
    また今回初めてAWSでのデプロイを行なったためセキュリティ面のベストプラクティスを達成できているかが分かりませんでした。
* モダンな開発環境への取り組み
    今回は、DockerやAWSなどの環境を用いましたが、今後はRuby on rails 5 から 6へバージョン更新やCircleCIなどのCI/CDなどのモダンな技術を導入しようと考えています。
* 機能数の少なさ
    ログイン機構やユーザー登録、他のAPI機能などを導入することで使用するユーザーにとって価値あるものを提供できるようにしたいです。