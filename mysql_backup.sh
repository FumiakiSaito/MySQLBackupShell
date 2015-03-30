#!/bin/sh
 
# バックアップファイルを何日分残しておくか
PERIOD=7
# バックアップファイルを保存するディレクトリ
DIRPATH='{ディレクトリパス}'
 
# ファイル名定義
FILENAME="mysqldump"`date +%Y%m%d`
 
# mysqldump実行
mysqldump --opt -Q -c --host={ホスト名} -u {ユーザー名} -{パスワード} {DB名} > $DIRPATH/$FILENAME.sql
 
# パーミッション変更
chmod 700 $DIRPATH/$FILENAME.sql
 
# 古いバックアップファイルを削除
OLDFILE="mysqldump"`date --date "$PERIOD days ago" +%Y%m%d`
echo $OLDFILE
rm -f $DIRPATH/$OLDFILE.sql
