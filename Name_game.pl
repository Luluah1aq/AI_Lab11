
% Lab 09 - The Name Game

% Start the program
start :-
    name_game([a, b, c]).

% Main menu
name_game(Letters) :-
    nl,
    write('Hi, This is the "Name Game"'),
    nl,
    write('Choose from the following:'),
    nl,
    write('1- Display the current set of letters'),
    nl,
    write('2- Add a letter'),
    nl,
    write('3- Add a letter at the top'),
    nl,
    write('4- Add a letter at the bottom'),
    nl,
    write('5- Delete a letter'),
    nl,
    write('6- Delete all letters'),
    nl,
    write('7- Exit'),
    nl,
    write('Enter your choice: '),
    read(Choice),
    process(Choice, Letters).

% 1 - Display letters
process(1, Letters) :-
    write('Current letters: '),
    write(Letters),
    nl,
    name_game(Letters).

% 2 - Add a letter
process(2, Letters) :-
    write('Enter a letter: '),
    read(X),
    append(Letters, [X], NewLetters),
    write('Letter added.'),
    nl,
    name_game(NewLetters).

% 3 - Add a letter at the top
process(3, Letters) :-
    write('Enter a letter: '),
    read(X),
    NewLetters = [X|Letters],
    write('Letter added at the top.'),
    nl,
    name_game(NewLetters).

% 4 - Add a letter at the bottom
process(4, Letters) :-
    write('Enter a letter: '),
    read(X),
    append(Letters, [X], NewLetters),
    write('Letter added at the bottom.'),
    nl,
    name_game(NewLetters).

% 5 - Delete a letter
process(5, Letters) :-
    write('Enter the letter to delete: '),
    read(X),
    ( select(X, Letters, NewLetters) ->
        write('Letter deleted.')
    ;
        write('Letter not found.'),
        NewLetters = Letters
    ),
    nl,
    name_game(NewLetters).

% 6 - Delete all letters
process(6, _) :-
    write('All letters deleted.'),
    nl,
    name_game([]).

% 7 - Exit
process(7, _) :-
    write('Goodbye!'),
    nl.

% Invalid choice
process(_, Letters) :-
    write('Invalid choice.'),
    nl,
    name_game(Letters).
