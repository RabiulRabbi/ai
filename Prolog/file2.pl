ensure_file_exists(File) :-
    not(file_exists(File)),
    open(File, write, Stream),
    close(Stream).

read_file(File) :-
    ensure_file_exists(File),
    open(File, read, Stream),
    read(Stream, Line),
    while(Line \== end_of_file,
           write(Line),
           read(Stream, Line)),
    close(Stream).

write_file(File, Content) :-
    ensure_file_exists(File),
    open(File, write, Stream),
    write(Stream, Content),
    close(Stream).