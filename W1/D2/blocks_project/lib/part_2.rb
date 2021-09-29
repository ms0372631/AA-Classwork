def all_words_capitalized?(arr)
    arr.all? {|a| a.capitalize == a}
end

def no_valid_url?(arr)
    urls = ["com", "net", "io", "org"]
    arr.none? do |a|
        urls.any? {|u| a.end_with?(u)}
    end
end

def any_passing_students?(hash)
    hash.any? {|h| h[:grades].sum / h[:grades].length >= 75}
end
