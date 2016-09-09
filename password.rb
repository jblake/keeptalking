VALID_PASSWORDS = [
    "about",
    "after",
    "again",
    "below",
    "could",
    "every",
    "first",
    "found",
    "great",
    "house",
    "large",
    "learn",
    "never",
    "other",
    "place",
    "plant",
    "point",
    "right",
    "small",
    "sound",
    "spell",
    "still",
    "study",
    "their",
    "there",
    "these",
    "thing",
    "think",
    "three",
    "water",
    "where",
    "which",
    "world",
    "would",
    "write",
]

def accept(word, letters)
    return false if word.length < letters.length
    letters.each_index do | i |
        return false if !letters[i].chars.member?(word[i])
    end
    return true
end

def password(*args)
    if args.length == 0 then
        letters = []
        while true do
            valid = VALID_PASSWORDS.find_all { | w | accept(w, letters) }
            if valid.length == 0 then
                $stderr.write("Invalid password!\n")
                break
            elsif valid.length == 1 then
                $stdout.write("Password is #{valid[0]}.\n")
                break
            end
            $stdout.write("Letters for position #{letters.length + 1}? ")
            letters << $stdin.readline.chomp
        end
    else
        $stderr.write("Usage: password\n")
    end
end
