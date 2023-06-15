# 一行コメント

# 複数コメント
=begin
これで複数行のコメントもOK
=end

print "hello world!"
puts "hello world!!" 	# 改行がつく.
p "hello world!!!"		# デバッグでつかう. 

# 変数は英小文字 or _ で始める必要がある
msg = "fxxn"
puts msg
msg = "override"
puts msg

# 定数は基本的に大文字ですべて書く
TEISUU = 114514
puts TEISUU
# TEISUU = 1919180
# puts TEISUU # warning は出すけどエラーにならない

puts "hello world".length
#
=begin
p 114514.class		# どの class に属しているか
p 114514.methods	# どんなメソッドが使えるか
=end

p Rational( 2, 5 ) + Rational( 2, 5 ) # 分数はこう表現する
p 2/5r + 2/5r # こっちでもOK

p 56.7.round	# 四捨五入　
p 56.7.floor	# 小数点以下切り捨て
p 56.7.ceil		# 小数点以下切りあげ

puts "price #{ 114514 * 1.08 }"	# 計算されたもの表示
puts 'price #{ 114514 * 1.08 }'	# 文字列として表示

name = "Ritta3D"
puts "name is #{ name }"

puts "hello" * 2	# ２回出力

# !がついたものは破壊的（元のオブジェクトを書き換える）メソッド
puts name.upcase
puts name
puts name.upcase!
puts name

# ?は真偽値
p name.empty?			# false
p name.include?( "R" )	# true

# 配列の定義
colors = [ "red", "blue", "yellow" ]

# 添え字に-1を指定すると末尾の要素を持ってくる
p colors[ -1 ]

# 範囲外指定の場合は nil が返される
p colors[ 4 ]

# 範囲を指定して書き換えることも可能
colors[ 1..2 ] = [ "black", "white" ]

# array[ 0..2 ]		( 0 <= x <= 2 )
# array[ 0 ... 2 ]	( 0 <= x <  2 )

# 要素の追加
colors.push( "gold" )
colors << "silver"

p colors

# 配列のサイズを返す
p colors.size

# 配列のソート
p colors.sort

# ハッシュ
# key / value
# scores = { "Rittai" => 114514, "ThreeD" => 100 }

# シンボルオブジェクト（コロンから始まる識別子のようなもの）
# こっちの方が高速
# scores = { :Rittai => 114514, :ThreeD => 100 }
scores = { Rittai: 114514, ThreeD: 100 }

p scores[ :Rittai ]
scores[ :ThreeD ] = 1000
p scores[ :ThreeD ]

# 要素数
p scores.size

# すべてのkeyを見る
p scores.keys

# すべてのvalueを見る
p scores.values

# key が存在するかを問う
p scores.has_key?( :Rittai )

# 変換
x = 50
y = "3"

p x + y.to_i # 整数に変換する
p x.to_s + y # 文字列に変換する

p scores.to_a # 配列に変換する
p scores.to_a.to_h # ハッシュに変換する


puts "he\"llo" # こういうことをしたいときは下の方が楽
puts 'hel\'lo'

puts %Q(he"llo)	# " のとき
puts %(hell'o)
puts %q(he-llo)	# ' のとき

p [ "red", "blue" ]
p [ 'red', 'blue' ]

p %W( red blue )
p %w( red blue )

# 文字列に値を埋め込む
# printf / sprintf でも使える
p "name: %s" % "hogehoge"
p "name: %10s" % "hogehoge"

# 複数埋め込む値があれば配列で
p "id: %05d, rate: %5.3f" % [ 114, 19.364 ]

v = 1

if v > 10
	puts "great"
elsif v > 5
	puts "so so..."
else
	puts "fuck"
end

signal = "red"

case signal
when "red"
	puts "stop"
when "blue"
	puts "go"
when "yellow"
	puts "caution!"
else 
	puts "fuuuuuuuck"
end

# 繰り返し
counter = 0
while counter < 10
	counter += 1
end

# times
# |i| でカウンタをセットできる
10.times do |i|
	puts "#{i} hello"
end

# 一行でもかける
5.times { |i| puts "#{i} foge" }

# for でもかける

for i in 0 ... 5 do
	puts i
end

for col in [ "red", "yellow", "blue" ] do
	puts i
end

for k, v in { hoge: 10, fuga: 30 } do
	puts "#{k} #{v}" 
end

# 内部的に同じことをしている（ {} は do end でも代用可能　）
[ "red", "yellow", "blue" ].each { |color|
	puts color
}

counter = 0
loop do
	if counter == 5
		break
	end

	# continue と同じ
	if counter == 7
		next
	end
	p counter
	counter += 1
end

# メソッド
# 引数を使わないのであれば書かなくてもいい
# クラス街メソッドは private である
def showHello
	puts "hello"
	# "hello"
	# とすると勝手に return されるので
	# p showHello が必要になる
	# string showHello() みたいな
end


# class 名は必ず大文字から
class User

	# クラス変数
	# static 変数のようなものですべてのインスタンスで同じ値が出る
	@@count = 0

	# 定数
	VERSION = 1.14514

	# 外部から参照できる変数
	# これは getter setter 両方あり、: の後ろに空白文字をいれてはいけない
	# attr_accessor :name

	# read only
	# attr_reader :age

	# initialize メソッドは自動で private 
	def initialize( name )
#
=begin
		@がつくとインスタンス変数となる
		ここでのインスタンス変数はメンバ変数と同じ意味である
		クラス定義内で定義しなくてもOK
=end
		@name = name
		@@count += 1
	end

	# 基本的にメソッドは public である
	# private の場合はレシーバーを指定できない

	def show
		# self.name とすると @name になるので
		# puts "#{self.name}" もOK
		puts "fuck #{@name}"
		sayPrivateMessage
	end

	# クラスメソッド
	# インスタンスを作らないでも呼べる. static 関数的な
	def self.info
		puts "User instance is #{@@count}"
		# クラスメソッドからは呼び出せない
		# sayPrivateMessage 
	end

	private
	# これ以降に書いた関数は private 扱い
	def sayPrivateMessage
		puts "private message"
	end
end

# インスタンス作成にはnewを使う
tom = User.new( "tom" )
tom.show # レシーバー

bob = User.new( "bob" )
steve = User.new( "steve" );

User.info
# 定数にはこれでアクセス
p User::VERSION

# class の継承
class AdminUser < User
	def showUserName
		puts "Admin fxxk"
		# こっちからも呼び出せる
		sayPrivateMessage
	end

	def sayPrivateMessage
		puts "override func"
	end
end

pom = AdminUser.new( "pom" )
# 親クラスのメソッドが使える
pom.show
pom.showUserName
pom.sayPrivateMessage

# module
# namespace として使う場合
# １文字目は大文字から
module Movie

	VERSION = 1.0

	def self.encode
		puts "encording..."
	end

	def self.export
		puts "exporting..."
	end
end

Movie.encode
Movie.export
p Movie::VERSION

# mixin として使う場合
# 共通するメソッドを外部に保持しておき、includeで各クラスごとに呼び出す
module Debug
	# self. をつけないとそれぞれの呼び出したところの扱いにできる
	def info
		puts "#{self.class} call."
	end
end

# 例えばゲームのプレイヤーと敵がいた場合
class Player
	include Debug
end

class Enemy
	include Debug
end

Player.new.info	# 呼び出したクラス名が入っている
Enemy.new.info

# 例外
# 例外が起きそうな場所をbegin end で囲ってしまう
x = 3
begin
	p 100/0

# 例外が発生したらここに飛ぶ
rescue => ex
	puts "Exception"
	p ex.message	# エラーメッセージを投げる
	p ex.class		# 例外クラス名を取得
# 例外が発生しようがしまいが呼び出される
ensure
	puts "END"
end

# 自分で例外クラスを作ることもできる
class MyError < StandardError ; end

begin
	# 例外を発生させる場合は raise で明示的に投げる
	if x == 3
		raise MyError
	end

rescue MyError
	puts "My ERROR"

rescue => ex
	p ex.class
	p ex.message
end
