#!/bin/bash

ans=/home/hiroty0712/tmp/$$-ans
result=/home/hiroty0712/tmp/$$-result
error=/home/hiroty0712/tmp/$$-error


ERROR_EXIT () {
    cat $error
    rm /home/hiroty0712/tmp/$$-*
    exit 1
}

#以下テスト
echo "test 1_正常動作確認(引数1 < 引数2)"
echo 2 > $ans
./gcd.sh 4 10 > $result
diff $ans $result || echo "error in test 1" >> $error

echo "test 2_正常動作確認(引数1 > 引数2)"
echo 7 > $ans
./gcd.sh 28 21 > $result
diff $ans $result || echo "error in test 2" >> $error

echo "test 3_異常動作確認(引数なし)"
echo "Error!" > $ans
./gcd.sh > $result
diff $ans $result || echo "error in test 3" >> $error

echo "test 4_異常動作確認(引数1つ)"
echo "Error!" > $ans
./gcd.sh > $result
diff $ans $result || echo "error in test 4" >> $error

echo "test 5_異常動作確認(引数がマイナス_1)"
echo "Error!" > $ans
./gcd.sh -4 10 > $result
diff $ans $result || echo "error in test 5" >> $error

echo "test 6_異常動作確認(引数がマイナス_2)"
echo "Error!" > $ans
./gcd.sh 28 -21 > $result
diff $ans $result || echo "error in test 6" >> $error

echo "test 7_異常動作確認(引数が0_1)"
echo "Error!" > $ans
./gcd.sh 0 10 > $result
diff $ans $result || echo "error in test 7" >> $error

echo "test 8_異常動作確認(引数が0_2)"
echo "Error!" > $ans
./gcd.sh 4 0 > $result
diff $ans $result || echo "error in test 8" >> $error

echo "test 9_異常動作確認(引数が文字列_1)"
echo "Error!" > $ans
./gcd.sh string 10 > $result
diff $ans $result || echo "error in test 9" >> $error

echo "test 10_異常動作確認(引数が文字列_2)"
echo "Error!" > $ans
./gcd.sh 4 string > $result
diff $ans $result || echo "error in test 10" >> $error

echo "test 11_異常動作確認(引数が浮動小数点数_1)"
echo "Error!" > $ans
./gcd.sh 4.5 9  string > $result
diff $ans $result || echo "error in test 11" >> $error

echo "test 12_異常動作確認(引数が浮動小数点数_2)"
echo "Error!" > $ans
./gcd.sh 9 4.5  string > $result
diff $ans $result || echo "error in test 12" >> $error

#エラー発生時の処理
if [ -f $error ]; then
    ERROR_EXIT
fi

echo  "Finish all tests"                
rm /home/hiroty0712/tmp/$$-* 

