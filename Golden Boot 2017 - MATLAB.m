clear;
close all;
clc;

Players = {'Lionel Messi', 'Bas Dost', 'Pierre-Emerick Aubameyang', 'Robert Lewandowski', 'Luis Suárez', 'Harry Kane', 'Edin Dzeko', 'Dries Mertens', 'Edinson Cavani', 'Cristiano Ronaldo', 'Anthony Modeste', 'Romelu Lukaku', 'Andrea Belotti', 'Gonzalo Higuaín', 'Alexis Sánchez', 'Mauro Icardi', 'Ciro Immobile', 'Timo Werner', 'Sergio Agüero', 'Diego Costa', 'Alexandre Lacazette', 'Iago Aspas', 'Francisco Soares', 'Uros Djurdjevic', 'Dele Alli'};
Age = [29, 27, 27, 28, 30, 23, 31, 30, 30, 32, 29, 24, 23, 29, 28, 24, 27, 21, 28, 28, 25, 29, 26, 23, 21];
Goals = [37, 34, 31, 30, 29, 29, 28, 27, 35, 25, 25, 25, 25, 24, 24, 24, 22, 21, 20, 20, 26, 19, 19, 24, 18];
Factors = [2, 2, 2, 2, 2, 2, 2, 2, 1.5, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 1.5, 2, 2, 1.5, 2];

Points = Goals .* Factors;

disp(Points);

Points = sort(Points, 'descend');

disp("Hello");

disp(Points);

%V = sort(YourMatrix(:), 'reverse');
%PointsTop10 = Points(1:10);

%bar(1:25,[PointsTop10; Age]');

%bar(1:10,[Points; Age]');

bar(1:15,[Points(1:15); Age(1:15)]');
xticks(1:1:15);
set(gca, 'XTickLabel', {'Lionel Messi', 'Bas Dost', 'Pierre-Emerick Aubameyang', 'Robert Lewandowski', 'Luis Suárez', 'Harry Kane', 'Edin Dzeko', 'Dries Mertens', 'Edinson Cavani', 'Cristiano Ronaldo', 'Anthony Modeste', 'Romelu Lukaku', 'Andrea Belotti', 'Gonzalo Higuaín', 'Alexis Sánchez', 'Mauro Icardi', 'Ciro Immobile', 'Timo Werner', 'Sergio Agüero', 'Diego Costa', 'Alexandre Lacazette', 'Iago Aspas', 'Francisco Soares', 'Uros Djurdjevic', 'Dele Alli'});
legend('Points', 'Age');
xtickangle(55);
title('Golden Boot 2017');


