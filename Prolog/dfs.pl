edges(a, b).
edges(a, c).
edges(b, c).
edges(b, d).
edges(c, d).
edges(d, e).
edges(e, f).

dfs(Start, Goal, Path) :-
    dfs_helper(Start, Goal, [Start], Path).

dfs_helper(Goal, Goal, AccPath, Path) :- reverse(AccPath, Path).
dfs_helper(Node, Goal, AccPath, Path) :-
    edges(Node, Next),
    \+ member(Next, AccPath),
    dfs_helper(Next, Goal, [Next|AccPath], Path).
