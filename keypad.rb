KEYPAD_SYMBOLS = [
    "©",
    "¶",
    "¿",
    "æ",
    "ƛ",
    "Ψ",
    "Ω",
    "ϗ",
    "Ϙ",
    "Ϟ",
    "Ͼ",
    "Ͽ",
    "б",
    "ѣ",
    "Ѧ",
    "Ѭ",
    "Ѯ",
    "Ѽ",
    "҂",
    "Ҋ",
    "Җ",
    "Ҩ",
    "Ӭ",
    "Ԇ",
    "ټ",
    "★",
    "☆",
]

KEYPAD_SETS = [
    [ "Ϙ", "Ѧ", "ƛ", "Ϟ", "Ѭ", "ϗ", "Ͽ" ],
    [ "Ӭ", "Ϙ", "Ͽ", "Ҩ", "☆", "ϗ", "¿" ],
    [ "©", "Ѽ", "Ҩ", "Җ", "Ԇ", "ƛ", "☆" ],
    [ "б", "¶", "ѣ", "Ѭ", "Җ", "¿", "ټ" ],
    [ "Ψ", "ټ", "ѣ", "Ͼ", "¶", "Ѯ", "★" ],
    [ "б", "Ӭ", "҂", "æ", "Ψ", "Ҋ", "Ω" ],
]

def keypad(*buttons)
    if buttons.length == 4 then
        KEYPAD_SETS.each do | set |
            ok = true
            buttons.each do | button |
                if not set.member?(button) then
                    ok = false
                    break
                end
            end
            if ok then
                $stdout.write("Press, in order:")
                set.each do | symbol |
                    if buttons.member?(symbol) then
                        $stdout.write(" #{symbol}")
                    end
                end
                $stdout.write("\n")
                return
            end
        end
        $stderr.write("That set of buttons does not make sense!\n")
    else
        $stderr.write("Usage: keypad <buttons>\n")
        $stderr.write("Symbols are: #{KEYPAD_SYMBOLS.join(" ")}\n")
    end
end
