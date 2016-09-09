#!/usr/bin/ruby

ALIASES = {
    "b" => "blue",
    "g" => "green",
    "r" => "red",
    "w" => "white",
    "x" => "black",
    "y" => "yellow",
}

$batteries = nil
def batteries()
    return $batteries if $batteries
    $stdout.write("Number of batteries? ")
    $batteries = $stdin.readline.chomp.to_i
    return $batteries
end

$lit = {}
def lit(label)
    return $lit[label] if $lit.member?(label)
    while true do
        $stdout.write("Lit indicator `#{label}'? (y/n) ")
        resp = $stdin.readline.chomp
        if resp == "y" then
            $lit[label] = true
            return true
        elsif resp == "n" then
            $lit[label] = false
            return false
        end
    end
end

$parallel = nil
def parallel()
    return $parallel if !$parallel.nil?
    while true do
        $stdout.write("Has a parallel port? (y/n) ")
        resp = $stdin.readline.chomp
        if resp == "y" then
            $parallel = true
            return true
        elsif resp == "n" then
            $parallel = false
            return false
        end
    end
end

$serial = nil
def serial()
    return $serial if $serial
    $stdout.write("Serial number? ")
    $serial = $stdin.readline.chomp
    return $serial
end

def apply_rules(rules, *args)
    rules.each do | rule, result |
        return result if rule.call(*args)
    end
    $stderr.write("Incomplete rules, panic!\n")
    return nil
end
