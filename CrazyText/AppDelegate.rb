#
#  AppDelegate.rb
#  CrazyText
#
#  Created by xhan on 3/31/11.
#  Copyright 2011 xu han. All rights reserved.
#

class AppDelegate
    attr_accessor :window, :tf_source, :tf_result
    attr_accessor :convertAry, :btnCurEffect
    attr_accessor :tf_textLength
    
    def initialize
      @convertAry = []
      @convertAry.push(
                {"name" => "Plain", "method" => "plain"},      
                {"name" => "Bubble", "method" => "bubble"},
                {"name" => "Upsidedown", "method" => "up_down" },
                {"name" => "Slash", "method" => "slash"},
                {"name" => "Greek", "method" => "geek" },
                {"name" => "Russian", "method" => "russian"},
                {"name" => "Weird", "method" => "weird"},
                {"name" => "Japan", "method" => "japan"},
                {"name" => "Medieval", "method" => "medieval"},
                {"name" => "Dots", "method" => "dots"},
                {"name" => "Tails", "method" => "tails"},
                {"name" => "Accents", "method" => "accents"},
                {"name" => "Number", "method" => "number"},                
                {"name" => "Line", "method" => "line"},
                {"name" => "Thailand", "method" => "thailand" },
                {"name" => "Symbols", "method" => "symbol"},
                {"name" => "Wacky", "method" => "wacky"},
                {"name" => "Reverse", "method" => "reverse"},
                {"name" => "ReverseWord", "method" => "reverse_word"},
                {"name" => "WOW", "method" => "juhua"}
        )
      @selected_effect = @convertAry[0]
      
    end
    
    def applicationDidFinishLaunching(a_notification)
        # Insert code here to initialize your application
        @converter = TextConverter.new
        @isExpand = false
        triggle_effects(@isExpand,false)
        setEffectByName(@selected_effect["name"])        
    end
    
    
    def triggle_effects(_isExpand,isAnimation)
       # height =  _isExpand ? 575 : 575 -230
      newFrame = @window.frame
      newFrame.size.height += _isExpand ? 230 : -230
      newFrame.origin.y -= _isExpand ? 230 : -230
      @window.setFrame(newFrame,:display => true, :animate => isAnimation)
    end
    
    def triggle_effect(sender)
      @isExpand = !@isExpand
      triggle_effects(@isExpand,true)
    end
    
    def controlTextDidChange(a_notification)
        str = tf_source.stringValue
        
        # result = @converter.juhua(str)
        # result = @converter.reverse(str)
        #        result = @converter.slash(str)
        #        puts result
        
        result = @converter.slash(str)
        tf_result.setStringValue(result)
        # tf_result.setStringValue(str)
    end
    
    def textDidChange(a_notification)
      str = tf_source.textStorage.string
      result = @converter.run(@selected_effect["method"], str)
      tf_result.setStringValue(result)
      tf_textLength.setStringValue(result.length.to_s)
    end
    
    def onEffectChanged(sender)
      title = sender.title
      setEffectByName(title)
    end
    
    def setEffectByName name  
      value = @convertAry.select { |hash| hash["name"] == name }
      if value.count >= 1
        @selected_effect = value.first
        btnCurEffect.setTitle(@selected_effect["name"])
        textDidChange(nil)        
      end

    end
end

