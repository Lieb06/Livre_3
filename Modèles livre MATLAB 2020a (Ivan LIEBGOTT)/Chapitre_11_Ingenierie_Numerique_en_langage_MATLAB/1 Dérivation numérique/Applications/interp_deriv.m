
clear all;
load pos_codeur_1000Hz.mat;

coef_poly_inter = polyfit(time,position_codeur,30);
t = linspace(0,10,100);
poly_inter = polyval(coef_poly_inter,t);

figure; grid on; grid minor;
hold all;
plot(time,position_codeur);
plot(t,poly_inter);

%% d�rivation du signal interpol�
nb_points = length(t);

% calcul du pas h
h = (t(end)-t(1))/(nb_points);

for k = 1:1:(nb_points-1)
    
        dY(k) = (poly_inter(k+1) - poly_inter(k))/h;

end

% cr�ation d'une nouvelle fen�tre graphique
fig = figure('Units','centimeters','Position',[2 5 35 25]);
set(fig,'Color','white');

% Trac� de la d�riv�e num�rique du signal brut non filtr�e
plot(t(1:end-1),dY);
grid on;
grid minor;
title('Calcul de la d�riv�e num�rique du signal non filtr�');

