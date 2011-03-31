//
//  main.m
//  CrazyText
//
//  Created by xhan on 3/31/11.
//  Copyright 2011 xu han. All rights reserved.
//

#import <Cocoa/Cocoa.h>

#import <MacRuby/MacRuby.h>

int main(int argc, char *argv[])
{
    return macruby_main("rb_main.rb", argc, argv);
}
