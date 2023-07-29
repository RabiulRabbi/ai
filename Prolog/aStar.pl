% Sample edge facts (replace this with your problem-specific graph)
edge(a, b, 3).
edge(a, c, 5).
edge(b, d, 2).
edge(c, d, 4).
edge(d, e, 6).
edge(c, e, 7).

% Sample heuristic function (replace this with your problem-specific heuristic)
heuristic(Node, H) :- % Replace this with your heuristic function.
    % For this example, we use a simple heuristic that returns 0 for the goal node (e) and 1 for all others.
    (Node = e -> H = 0 ; H = 1).

% Find the best move to reach the goal state
a_star(Start, Goal, Path) :-
    heuristic(Start, H),
    a_star([(H, Start, [], 0)], Goal, PathRev),
    reverse(PathRev, Path).

% A* search algorithm
a_star([], _, _) :- !, fail. % No path found
a_star([(_, Goal, Path, _) | _], Goal, Path).
a_star([(_, State, AccPath, G) | Rest], Goal, Path) :-
    findall((F, NewState, [Move | AccPath], NewG),
            (edge(State, NewState, Cost), heuristic(NewState, H),
             NewG is G + Cost, F is NewG + H),
            Successors),
    append(Rest, Successors, NewQueue),
    sort(NewQueue, SortedQueue), % Sort the queue based on F value
    a_star(SortedQueue, Goal, Path).

% Example usage:
% Let's say we want to find the optimal path from node a to node e in the graph defined by edge facts.
% Usage: a_star(a, e, Path).
% Path will be a list of nodes representing the optimal path (e.g., [a, b, d, e]).
