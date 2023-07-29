% Facts representing grades for each course
grade(english, 3).  % Grade for English is 3 (B)
grade(math, 3).     % Grade for Math is 4 (A)
grade(history, 2).  % Grade for History is 2 (C)

% GPA calculation predicate
gpa() :-
    findall(Grade, grade(_, Grade), Grades),
    sum_list(Grades, TotalGrade),
    length(Grades, NumberOfCourses),
    GPA is TotalGrade / NumberOfCourses,
    format("GPA is: ~2f~n", [GPA]).


