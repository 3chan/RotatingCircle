# RotatingCircle
Processing で円の内側を回る円を描画する 

## 動作
左クリック：最少の円の中に新たな円を描画  
右クリック：最小の円を削除  
最大同時に5つまで描画します  

## 参考
Processing tutorials の Array of Objects を見ながら書きました  
https://processing.org/tutorials/arrays/

## メモ
クラスの使い方が少し分かった  
始め円ごとに pushMatrix, popMatrix を使って translate していたら、第3円以降位置がずれてしまった  
-> draw 関数を回す度に (width / 2, height / 2) へ座標の中心が初期化されていたため？  
-> translate は draw のみ、円の中心位置は自分で足し算する方式にしたところうまくいった
