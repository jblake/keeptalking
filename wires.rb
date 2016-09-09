WIRES_RULES = {
    3 => [
        [ proc { | w | w.count("red") == 0 }, "second" ],
        [ proc { | w | w[-1] == "white" }, "last" ],
        [ proc { | w | w.count("blue") > 1 }, "last blue" ],
        [ proc { | w | true }, "last" ],
    ],
    4 => [
        [ proc { | w | w.count("red") > 1 and serial =~ /[13579][^0-9]*$/ }, "last red" ],
        [ proc { | w | w[-1] == "yellow" and WIRES.count("red") == 0 }, "first" ],
        [ proc { | w | w.count("blue") == 1 }, "first" ],
        [ proc { | w | w.count("yellow") > 1 }, "last" ],
        [ proc { | w | true }, "second" ],
    ],
    5 => [
        [ proc { | w | w[-1] == "black" and serial =~ /[13579][^0-9]*$/ }, "fourth" ],
        [ proc { | w | w.count("red") == 1 and WIRES.count("yellow") > 1 }, "first" ],
        [ proc { | w | w.count("black") == 0 }, "second" ],
        [ proc { | w | true }, "first" ],
    ],
    6 => [
        [ proc { | w | w.count("yellow") == 0 and serial =~ /[13579][^0-9]*$/ }, "third" ],
        [ proc { | w | w.count("yellow") == 1 and WIRES.count("white") > 1 }, "fourth" ],
        [ proc { | w | w.count("red") == 0 }, "last" ],
        [ proc { | w | true }, "fourth" ],
    ],
}

def wires(*w)
    if WIRES_RULES.member?(w.length) then
        $stdout.write("Cut the #{apply_rules(WIRES_RULES[w.length], w)} wire.\n")
    else
        $stderr.write("Usage: wires <list of colors, first to last>\n")
    end
end
