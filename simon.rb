SIMON_RULES_VOWEL = {
    0 => {
        "blue" => "red",
        "green" => "yellow",
        "red" => "blue",
        "yellow" => "green",
    },
    1 => {
        "blue" => "green",
        "green" => "blue",
        "red" => "yellow",
        "yellow" => "red",
    },
    2 => {
        "blue" => "red",
        "green" => "yellow",
        "red" => "green",
        "yellow" => "blue",
    },
}

SIMON_RULES_NOVOWEL = {
    0 => {
        "blue" => "yellow",
        "green" => "green",
        "red" => "blue",
        "yellow" => "red",
    },
    1 => {
        "blue" => "blue",
        "green" => "yellow",
        "red" => "red",
        "yellow" => "green",
    },
    2 => {
        "blue" => "green",
        "green" => "blue",
        "red" => "yellow",
        "yellow" => "red",
    },
}

def simon(*args)
    if args.length == 1 then
        strikes = args[0].to_i
        sequence = []
        if serial =~ /[aeiou]/i then
            rules = SIMON_RULES_VOWEL[strikes]
        else
            rules = SIMON_RULES_NOVOWEL[strikes]
        end
        while true do
            $stdout.write("Last color? ")
            color = $stdin.readline.chomp
            break if color == ""
            color = ALIASES[color] if ALIASES.member?(color)
            sequence << rules[color]
            $stdout.write("Sequence: #{sequence.join(" ")}\n")
        end
    else
        $stderr.write("Usage: simon <number of fuckups>\n")
    end
end
