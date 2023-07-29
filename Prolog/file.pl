writeFile(File) :-
   tell(File),
   write("This is a demo."),
   told,
   writeln("Written in File.").

readFile(File) :-
   open(File,read,Str),
   readWords(Str,Words),
   close(Str),
   write(Words),  nl.

readWords(Stream,[]):-
   at_end_of_stream(Stream).

readWords(Stream,[X|L]):-
   \+ at_end_of_stream(Stream),
   readWord(Stream,X),
   readWords(Stream,L).

readWord(InStream,W):-
         get_code(InStream,Char),
         checkCharAndReadRest(Char,Chars,InStream),
         atom_codes(W,Chars).


   checkCharAndReadRest(10,[],_):-  !.

   checkCharAndReadRest(32,[],_):-  !.

   checkCharAndReadRest(-1,[],_):-  !.

   checkCharAndReadRest(end_of_file,[],_):-  !.

   checkCharAndReadRest(Char,[Char|Chars],InStream):-
         get_code(InStream,NextChar),
         checkCharAndReadRest(NextChar,Chars,InStream).