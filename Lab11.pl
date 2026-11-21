
:- dynamic letter/1.

% Initial letters
letter(a).
letter(b).
letter(c).

% Start the game
start :-
    writeln('Hi. This is the Name Game.'),
    writeln('You will be given a set of English letters in which you will add, delete or move to create your name.'),
    menu.

% Display the menu
menu :-
    nl,
    writeln('Choose from the following:'),
    writeln('1- Display the current set of letters'),
    writeln('2- Add a letter'),
    writeln('3- Add a letter at the top'),
    writeln('4- Add a letter at the bottom'),
    writeln('5- Delete a letter'),
    writeln('6- Delete all letters'),
    writeln('7- Exit'),
    writeln('Enter your choice....'),
    read(Choice),
    action(Choice).

% Display all letters
action(1) :-
    !,
    findall(X, letter(X), List),
    writeln(List),
    menu.

% Add a letter
action(2) :-
    !,
    write('Enter a letter: '),
    read(X),
    assert(letter(X)),
    menu.

% Add a letter at the top
action(3) :-
    !,
    write('Enter a letter: '),
    read(X),
    asserta(letter(X)),
    menu.

% Add a letter at the bottom
action(4) :-
    !,
    write('Enter a letter: '),
    read(X),
    assertz(letter(X)),
    menu.

% Delete a letter
action(5) :-
    !,
    write('Enter the letter to delete: '),
    read(X),
    (retract(letter(X)) ->
        writeln('Letter deleted.')
    ;
        writeln('Letter not found.')
    ),
    menu.

% Delete all letters
action(6) :-
    !,
    retractall(letter(_)),
    writeln('All letters deleted.'),
    menu.

% Exit the game
action(7) :-
    !,
    writeln('Goodbye!').

% Invalid choice
action(_) :-
    writeln('Invalid choice.'),
    menu.
