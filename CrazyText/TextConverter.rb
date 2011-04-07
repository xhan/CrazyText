#
#  TextConverter.rb
#  CrazyText
#
#  Created by xhan on 3/31/11.
#  Copyright 2011 xu han. All rights reserved.
#

# scan(/./m) means each world(UTF8) codes from jcode

class TextConverter
  
  def initialize
    @abc52 = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
    @ary_abc = @abc52.scan(/./m)
  end
  
  def run(methodName,string)
    instance_eval("#{methodName}(%{#{string}})")
  end
  
  def plain(str)
    str
  end
  
  def juhua(str)    
    str.gsub(/\B/m,"\322\211")
     # str.scan(/./m).map{ |char| char == " "[0] ? char : "\322#{char}\211"}.join
  end
  
  def reverse(str)
      str.scan(/./m).reverse.join  
  end
  
  def reverse_word(str)
    str.scan(/\w+/m).reverse.join(' ')
  end
  
  def reverse_ii(str)    
    "\342\200\256"<<str    
  end

  def test(str)
    str.gsub(/\B/m,"̸")
  end


  def up_down(str)
      table = {}
      foo = "abcdefghijklmnopqrstuvwxyz:;,.!?"
      bar = "ɐqɔpǝɟƃɥıɾʞlɯuodbɹsʇnʌʍxʎz:؛'˙¡¿"
      arr_foo = foo.scan(/./m)
      arr_bar = bar.scan(/./m)
      (0..31).each do |i| 
        table[arr_foo[i]] = arr_bar[i]
      end
      str.scan(/./m).map{|c| table[c] ? table[c] : c}.join
      
  end


#  crazy text
  def bubble(str)
    convert_by_abc_string(str,"ⓐⓑⓒⓓⓔⓕⓖⓗⓘⓙⓚⓛⓜⓝⓞⓟⓠⓡⓢⓣⓤⓥⓦⓧⓨⓩⒶⒷⒸⒹⒺⒻⒼⒽⒾⒿⓀⓁⓂⓃⓄⓅⓆⓇⓈⓉⓊⓋⓌⓍⓎⓏ")
  end
  
  def geek(str)
    convert_by_abc_string(str,"ΔβCDΣҒGHIJKLMΠΩPQRSTU∇ШXΨZΔβCDΣҒGHIJKLMΠΩPQRSTU∇ШXΨZ")
  end
  
  def slash(str)
    abc_key = "a̸b̸c̸d̸e̸f̸g̸h̸i̸j̸k̸l̸m̸n̸o̸p̸q̸r̸s̸t̸u̸v̸w̸x̸y̸z̸A̸B̸C̸D̸E̸F̸G̸H̸I̸J̸K̸L̸M̸N̸O̸P̸Q̸R̸S̸T̸U̸V̸W̸X̸Y̸Z̸"
    table = {}
    array_goal = abc_key.scan(/../m)
     return  nil if array_goal.count != 26*2
    
    (0..25).each do |i|
      table[@ary_abc[i]] = array_goal[i]
    end
    str.scan(/./m).map{|c| table[c] ? table[c] : c}.join    
  end
  
  def russian(str)
    convert_by_abc_string(str,"ДБCDΞFGHIJҜLMИФPǪЯSΓЦVЩЖУZДБCDΞFGHIJҜLMИФPǪЯSΓЦVЩЖУZ")
  end
  
  def weird(str)
    convert_by_abc_string(str,"ɑБϲժҽƒցհíյƘӀʍղօԹզɾՏԵմѵա×վՀɑБϲժҽƒցհíյƘӀʍղօԹզɾՏԵմѵա×վՀ")
  end
  
  def japan(str)
    convert_by_abc_string(str,"丹乃匚刀モ下ム卄工ＪＫㄥ爪れ◯ㄗＱ尺ち匕∪∨山メㄚ乙丹乃匚刀モ下ム卄工ＪＫㄥ爪れ◯ㄗＱ尺ち匕∪∨山メㄚ乙")
  end
  
  def medieval(str)
    convert_by_abc_string(str,"λB₡ÐE₣GҤłJƘŁM₦ØPQƦ$ŦUV₩X¥ZλB₡ÐE₣GҤłJƘŁM₦ØPQƦ$ŦUV₩X¥Z")
  end
  
  def dots(str)
    # str.gsub(/\B/m,"̤̈")
    # version 2 , 32 = space
    str.scan(/./m).map{ |char| char == " "[0] ? char : "#{char}̤̈"}.join
  end
  
  def tails(str)
    convert_by_abc_string(str,"ąɓçdęƒɠђįʝķɭɱŋǫƥʠŗşţųvwҳƴʐĄβÇDĘƑĢҢĮJĶĻMƝǪƤQŖŞŢŲVWҲҶζ")
  end
  
  def accents(str)
    convert_by_abc_string(str,"ÁßČĎĔŦĞĤĨĴĶĹMŃŐPQŔŚŤÚVŴЖŶŹÁßČĎĔŦĞĤĨĴĶĹMŃŐPQŔŚŤÚVŴЖŶŹ")
  end
  
  def number(str)
    convert_by_abc_string(str,"48(d3f9h!jk1mn0pqr57uvwxy248(d3f9h!jk1mn0pqr57uvwxy2")
  end
  
  def line(str)
    # str.gsub(/\B/m,"̲̅")
    str.scan(/./m).map{ |char| char == " "[0] ? char : "#{char}̲̅"}.join
  end
  
  def thailand(str)
    convert_by_abc_string(str,"ค๒ς๔єŦɠђเןкl๓ภ๏ԹợгรԵยשฬאվzค๒ς๔єŦɠђเןкl๓ภ๏ԹợгรԵยשฬאվz")
  end
  
  def symbol(str)
    convert_by_abc_string(str,"⋀♇☪☭☰╒ⓖ♅¡♩⊀↳♍♌☻☟φ®$☂☋▽♆✄¥☡⋀♇☪☭☰╒ⓖ♅¡♩⊀↳♍♌☻☟φ®$☂☋▽♆✄¥☡")
  end
  
  def wacky(str)
    convert_by_abc_string(str,"ąßcđ૯FGસIJKLMர૭PQરş┼ચVЩﾒY乙ąßcđ૯FGસIJKLMர૭PQરş┼ચVЩﾒY乙")
  end
  
  private
  def convert_by_abc_string(origin,abc_key)
    table = {}
    array_goal = abc_key.scan(/./m)
     return  nil if array_goal.count != 26*2
    
    (0..51).each do |i|
      table[@ary_abc[i]] = array_goal[i]
    end
    origin.scan(/./m).map{|c| table[c] ? table[c] : c}.join
  end
  
end