COMPLEX_TRUTH_TABLE = {
    #   Red     Blue    Star    LED     Result
    [   false,  false,  false,  false   ] => proc { "Cut" },
    [   false,  false,  false,  true    ] => proc { "Leave" },
    [   false,  false,  true,   false   ] => proc { "Cut" },
    [   false,  false,  true,   true    ] => proc { batteries > 1 ? "Cut" : "Leave" },
    [   false,  true,   false,  false   ] => proc { serial =~ /[02468][^0-9]*$/ ? "Cut" : "Leave" },
    [   false,  true,   false,  true    ] => proc { parallel ? "Cut" : "Leave" },
    [   false,  true,   true,   false   ] => proc { "Leave" },
    [   false,  true,   true,   true    ] => proc { parallel ? "Cut" : "Leave" },
    [   true,   false,  false,  false   ] => proc { serial =~ /[02468][^0-9]*$/ ? "Cut" : "Leave" },
    [   true,   false,  false,  true    ] => proc { batteries > 1 ? "Cut" : "Leave" },
    [   true,   false,  true,   false   ] => proc { "Cut" },
    [   true,   false,  true,   true    ] => proc { batteries > 1 ? "Cut" : "Leave" },
    [   true,   true,   false,  false   ] => proc { serial =~ /[02468][^0-9]*$/ ? "Cut" : "Leave" },
    [   true,   true,   false,  true    ] => proc { serial =~ /[02468][^0-9]*$/ ? "Cut" : "Leave" },
    [   true,   true,   true,   false   ] => proc { parallel ? "Cut" : "Leave" },
    [   true,   true,   true,   true    ] => proc { "Leave" },
}

def complex(*args)
    if args.length != 0 then
        red = args.member?("red")
        blue = args.member?("blue")
        star = args.member?("star")
        led = args.member?("led")
        $stdout.write("#{COMPLEX_TRUTH_TABLE[[red,blue,star,led]].call} the wire.\n")
    else
        $stderr.write("Usage: complex <keywords>\n")
        $stderr.write("Keywords are for a single wire, and should include its colors,\n")
        $stderr.write("as well as `star' and `led' if there is a star marking or lit LED for that wire.\n")
    end
end
