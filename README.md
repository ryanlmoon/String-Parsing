# String Parsing
Copyright (c) 2021 Ryan Moon

## About
A string is an array representing a sequence of characters. To store a string of n characters in your program, you need to set aside n+1 bytes of memory. This allocated memory will contain the string’s characters plus one extra unique character — the null character — to mark the string’s end. The null character is a byte whose bits are all zeros (0x00). The actual string
consists of any group of characters, which none of them can be the null character. 

## Assignment
Write an ARM assembly language program to copy a null-terminated STRING1 to a nullterminated STRING2, after removing any occurrences of the word “the” (case sensitive) in STRING1. 

i.e., if STRING1 is “**the** woman and **The** man said **the**” then STRING2 would become, “ woman and **The** man said ”. 

However, if STRING1 is “and **the**y took brea**the**” then STRING2 would become “and **the**y took brea**the**” without any change. You can assume that STRING2 will be less than 128 characters