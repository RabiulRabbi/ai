edges(a, b).
edges(a, c).
edges(b, c).
edges(b, d).
edges(c, d).
edges(d, e).
edges(e, f).

bfs(Start, Goal, Path) :-
    bfs_queue([[Start]], Goal, RevPath),
    reverse(RevPath, Path).

bfs_queue([[Node|Path]|_], Node, [Node|Path]).
bfs_queue([[Node|Path]|Rest], Goal, FinalPath) :-
    findall([Next, Node|Path],
            (edges(Node, Next), \+ member(Next, [Node|Path])),
            NextPaths),
    append(Rest, NextPaths, UpdatedQueue),
    bfs_queue(UpdatedQueue, Goal, FinalPath).
bfs_queue([_|Rest], Goal, Path) :-
    bfs_queue(Rest, Goal, Path).