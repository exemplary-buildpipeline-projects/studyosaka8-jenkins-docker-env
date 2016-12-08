# AWS上のJenkins

## What's this ?

- AWSに設定する「MasterとなるJenkins」のAnsibleプロビジョニングコードです
- 一部手動操作を含みます

## 完成後の接続情報

### URL

- Jenkins : http:/[aws-hostname]:8080/

---

## 前提

以下は「プロビジョニングの実行元ホスト(プロビジョニング対象とは異なる)」に予め行っている前提の設定です。

(対象のホスト内からでも可)


- git,anshible

※ContOS6系の例

```bash
yum update
yum install epel-release
yum install git
yum install ansible --enablerepo=epel-testing
```

## プロビジョニング実行方法

上記前提を整えた状態で、このREADMEが在るディレクトリで、以下を実行してください。

```bash
ansible-playbook --private-key=XXX.pem -i hosts -u root main.yml
```
## プロビジョニング後の手動作業

### Jenkinsの設定

- インストール後「内部のファイルからパスワードを抜け」と言われる
  - 今回、自身サーバの /var/local/jenkins へとデータディレクトリをマッピングしたので、 /var/local/jenkins/secrets/initialAdminPassword から抜きましょう
- Pluginのインストール
  - Install Suggest plugins を選ぶ
- 管理者ユーザ入力
  - admin で
- 一般ログイン用ユーザを追加
  - jenkinsでログイン出来るように

## Nexusの設定

[こちら](./setup-as-code/NEXUS_OPERATION.md)

## sonarqubeの設定

[こちら](./setup-as-code/SONARQUBE_OPERATION.md)
