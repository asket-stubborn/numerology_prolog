#include @"pfc\list\list.ph"
#include @"pfc\string\string.ph"

class numerology
    open core

domains
    list = char*.
    s = string.
    sum = string.
    n = integer.

predicates
    run : runnable.
    string_to_list : (s, list [out]) nondeterm.
    solve : (s, n) nondeterm.

end class numerology

implement numerology

clauses
    string_to_list("", []) :-
        !.
    string_to_list(String, [Head | ListTail]) :-
        string::frontchar(String, Head, StringTail),
        string_to_list(StringTail, ListTail).

clauses
    solve(" ", _).
    solve(S, N) :-
        string_to_list("AJS", First),
        string_to_list("BKT", Second),
        string_to_list("CLU", Third),
        string_to_list("DMY", Fourth),
        string_to_list("ENW", Fifth),
        string_to_list("FOX", Sixth),
        string_to_list("GPY", Seventh),
        string_to_list("HQY", Eigth),
        string_to_list("IR", Ninth),
        string_to_list(S, S1),
        /*  setof(C, R ^ (select(C, S1, R) and membercheck(C, R)), L),*/
        /*  list2set(S1, S2),
        list2set(L, L2),
        list2set(First, F1),
        list2set(Second, SE2),
        list2set(Third, T2),
        list2set(Fourth, F2),
        list2set(Fifth, F3),
        list2set(Sixth, SI1),
        list2set(Seventh, SE3),
        list2set(Eigth, E1),
        list2set(Ninth, N1),*/
        C1 = list::intersection(S1, First),
        L11 = list::length(C1),
        L11 = L11 * 1,
        C2 = list::intersection(S1, Second),
        L12 = list::length(C2),
        L12 = L12 * 2,
        C32 = list::intersection(S1, Third),
        L23 = list::length(C32),
        L23 = L23 * 3,
        C42 = list::intersection(S1, Fourth),
        L24 = list::length(C42),
        L24 = L24 * 4,
        C52 = list::intersection(S1, Fifth),
        L25 = list::length(C52),
        L25 = L25 * 5,
        C62 = list::intersection(S1, Sixth),
        L26 = list::length(C62),
        L26 = L26 * 6,
        C72 = list::intersection(S1, Seventh),
        L27 = list::length(C72),
        L27 = L27 * 7,
        C82 = list::intersection(S1, Eigth),
        L28 = list::length(C82),
        L28 = L28 * 8,
        C92 = list::intersection(S1, Ninth),
        L29 = list::length(C92),
        L29 = L29 * 9,
        LS = L11 + L12 + L23 + L24 + L25 + L26 + L27 + L28 + L29,
        if LS = N then
            SUM = 1
        else
            SUM = 0
        end if,
        stdio::write(SUM).

clauses
    run() :-
        console::write("Input string:"),
        stdio::nl,
        SA = console::readLine(),
        console::write("Input sum:"),
        stdio::nl,
        SB = console::readLine(),
        B = toTerm(SB),
        solve(SA, B),
        !,
        console::write("Done!").
    run() :-
        console::write("Failed!").

end implement numerology

goal
    console::runUtf8(numerology::run).
