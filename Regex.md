# Regular Expressions Notes

https://thevaluable.dev/regular-expression-basics-vim-grep/
https://thevaluable.dev/vim-regular-expressions-in-depth/

# Common NeoVim Regex Patterns

. - matches any single character except newline
[a-z] - matches any lowercase letter
[A-Z] - matches any uppercase letter
[a-zA-Z] - matches any letter (lowercase or uppercase)

## Shortcuts

\d - matches any digit (equivalent to [0-9])
\w - matches any word character (equivalent to [a-zA-Z0-9_])
\s - matches any whitespace character (space, tab, newline)
\D - matches any non-digit character (equivalent to [^0-9])
\W - matches any non-word character (equivalent to [^a-zA-Z0-9_])
\S - matches any non-whitespace character (equivalent to [^ \t\n])

## Negated Character Classes

[^a-z] - matches any character that is not a lowercase letter
[^A-Z] - matches any character that is not an uppercase letter
[^0-9] - matches any character that is not a digit
[^a-zA-Z0-9_] - matches any character that is not a word character
[^ \t\n] - matches any character that is not whitespace

## Quantifiers

* - matches zero or more occurrences of the preceding element
+ - matches one or more occurrences of the preceding element
? - matches zero or one occurrence of the preceding element
{n} - matches exactly n occurrences of the preceding element
{n,} - matches n or more occurrences of the preceding element
{n,m} - matches between n and m occurrences of the preceding element

# Anchors

^ - matches the start of a line
$ - matches the end of a line
\b - matches a word boundary (position between a word character and a non-word character)
\B - matches a non-word boundary (position between two word characters or two non-word characters)

# Grouping and Capturing

(abc) - matches the exact sequence "abc" and captures it as a group
(?:abc) - matches the exact sequence "abc" but does not capture it (non-capturing group)
(?<name>abc) - matches the exact sequence "abc" and captures it with a name "name"

# Word Boundaries

\<word\> - matches the exact word "word" (surrounded by word boundaries)





# Learning Examples

## Example 1: Match 4 digit year

/\d{4}

## Example 2: Replace every single year in file with 2023

:%s/\d\{4\}/2023/g


## Example 3: Find <div><div> using a group

/\(<div>\)\{2\}

## Example 4: Replace every print statement with a variable assignment

:%s/print(\(.*\))/var = \1

## Example 5: Replace Example 4 again

:%s/var = \(.*\)/print(\1)/g
