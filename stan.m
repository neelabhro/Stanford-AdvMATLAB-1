%Neelabhro Roy
%IIIT-Delhi,India

clear;
clc;

g = read_courses('courses.txt');
%% 
% Here is the content of g:
% 
% * |g{i,1}| - cell array for course number (cross-listings not included)
% * |g{i,2}| - string containing course title
% * |g{i,3}| - string containing term course was taken
% * |g{i,4}| - double containing number of units
% * |g{i,5}| - string specifying whether pass/not pass or letter grade
% * |g{i,6}| - string containing grade
% 
courses = make_course_struct(g);
%For computing the GPA
%A separate file has been added to compute the GPA
gpa = GPA(courses)

%To find department with highest number of units
depts = unique({courses.department});
n = length(depts);
total_gpa_units = zeros(n,1);
for i=1:n
    total_gpa_units(i) = sum([courses(strcmp({courses.department}, depts{i})==1).gpa_units]);
end
[val, idx] = max(total_gpa_units);
Max_Unit_Dep = depts(idx)

%To find the quarter with the lowerst GPA
qtrs = unique({courses.quarter});
m = length(qtrs);
qtr_gpas = zeros(m,1);
for i=1:m
    qtr_gpas(i) = GPA(courses(strcmp({courses.quarter}, qtrs{i})==1));
end
[val, idx] = min(qtr_gpas);
Quarter_min_GPA = qtrs(idx)

%For the difference between first and last quarter
courses_first_qtr = courses(strcmp({courses.quarter}, 'Summer')==1 & [courses.academic_year]==0);
courses_last_qtr = courses(strcmp({courses.quarter}, 'Winter')==1 & [courses.academic_year]==3);
gpa_first_qtr = GPA(courses_first_qtr);
gpa_last_qtr = GPA(courses_last_qtr);

GPA_Diff = gpa_first_qtr - gpa_last_qtr

% Calculate the total number of classes taken
Classes_Taken = length(courses)

% total number of graudation units
Total_Graduation_Units = sum([courses.grad_units])
%% Checkpoint
% Please answer the following questions and put the answers in the EdX page:
% 
% (A) What is the cumulative GPA? Round it to the nearest hundredth.
% 
% (B) Which department is associated with the highest number of units?
% 
% (C) Which quarter is associated with the lowest GPA?
% 
% (D) What is the difference GPA between the first quarter and the last quarter 
% in the record? Answer as an absolute value rounded to the nearest hundredth.
% 
% (E) What is the total number of classese taken?
% 
% (F) What is the total number of graduation units (includes those taken 
% for letter grade and P/NP)?