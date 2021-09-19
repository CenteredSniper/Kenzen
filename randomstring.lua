local valid_chars = {}

local function set_valid(x, y)
    for i = string.byte(x), string.byte(y) do
        table.insert(valid_chars, string.char(i))
    end
end

local function random_string(length)
    local s = {}

    for i = 1, length do s[i] = valid_chars[math.random(1, #valid_chars)] end

    return table.concat(s)
end

set_valid('a', 'z')
set_valid('A', 'Z')
set_valid('0', '9')

return random_string(10)
