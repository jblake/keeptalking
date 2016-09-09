MORSE_ALPHABET = {
    "a" => ".-",
    "b" => "-...",
    "c" => "-.-.",
    "d" => "-..",
    "e" => ".",
    "f" => "..-.",
    "g" => "--.",
    "h" => "....",
    "i" => "..",
    "j" => ".---",
    "k" => "-.-",
    "l" => ".-..",
    "m" => "--",
    "n" => "-.",
    "o" => "---",
    "p" => ".--.",
    "q" => "--.-",
    "r" => ".-.",
    "s" => "...",
    "t" => "-",
    "u" => "..-",
    "v" => "...-",
    "w" => ".--",
    "x" => "-..-",
    "y" => "-.--",
    "z" => "--..",
}

MORSE_STRINGS = {
    "shell" => "3.505",
    "halls" => "3.515",
    "slick" => "3.522",
    "trick" => "3.532",
    "boxes" => "3.535",
    "leaks" => "3.542",
    "strobe" => "3.545",
    "bistro" => "3.552",
    "flick" => "3.555",
    "bombs" => "3.565",
    "break" => "3.572",
    "brick" => "3.575",
    "steak" => "3.582",
    "sting" => "3.592",
    "vector" => "3.595",
    "beats" => "3.600",
}

def morse(*args)
    begin
        system("stty", "cbreak")
        if args.length == 0 then
            $stdout.write("Start entering morse code: (-/.) ")
            str = ""
            while true do
                chr = $stdin.getc.chr
                next unless chr == '-' or chr == '.'
                str << chr
                matching = []
                MORSE_STRINGS.each do | source, freq |
                    morse = source.chars.map { | c | MORSE_ALPHABET[c] }.join("")
                    domain = morse
                    domain += morse while domain.length < str.length
                    domain += morse
                    if domain =~ /#{Regexp.escape(str)}/ then
                        matching << source
                    end
                end
                if matching.empty? then
                    $stderr.write("\nNo match!\n")
                    break
                elsif matching.length == 1 then
                    $stdout.write("\nTransmit at #{MORSE_STRINGS[matching[0]]} MHz.\n")
                    break
                end
            end
        else
            $stderr.write("Usage: morse\n")
        end
    ensure
        system("stty", "-cbreak")
    end
end
