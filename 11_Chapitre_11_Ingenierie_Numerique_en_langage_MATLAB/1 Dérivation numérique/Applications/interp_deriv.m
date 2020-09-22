
clear all;
load pos_codeur_1000Hz.mat;

coef_poly_inter = polyfit(time,position_codeur,30);
t = linspace(0,10,100);
poly_inter = polyval(coef_poly_inter,t);

figure; grid on; grid minor;
hold all;
plot(time,position_codeur);
plot(t,poly_inter);

%% dérivation du signal interpolé
nb_points = length(t);

% calcul du pas h
h = (t(end)-t(1))/(nb_points);

for k = 1:1:(nb_points-1)
    
        dY(k) = (poly_inter(k+1) - poly_inter(k))/h;

end

% création d'une nouvelle fenêtre graphique
fig = figure('Units','centimeters','Position',[2 5 35 25]);
set(fig,'Color','white');

% Tracé de la dérivée numérique du signal brut non filtrée
plot(t(1:end-1),dY);
grid on;
grid minor;
title('Calcul de la dérivée numérique du signal non filtré');

