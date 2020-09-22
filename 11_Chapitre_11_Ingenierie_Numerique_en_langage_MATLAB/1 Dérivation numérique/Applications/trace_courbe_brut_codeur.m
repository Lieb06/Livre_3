%% Effacement des variables du workspace
clear all;

% chargement des données correspondant au signal du codeur et au temps dans
% le workspace
load filtrage_mgl.mat;

%% Tracé du signal non filtré la fenêtre graphique


% création d'une nouvelle fenêtre graphique
fig = figure('Units','centimeters','Position',[2 5 35 25]);
set(fig,'Color','white');
plot(t,position_codeur);
grid on;
grid minor;
title('Signal issu de la mesure de la position par un codeur');


%% dérivation brut sans filtrage avec un pas de temps très faible
nb_points = length(t);

% calcul du pas h
h = (t(end)-t(1))/(nb_points - 1);

for k = 1:1:(nb_points-1)
    
        dY(k) = (position_codeur(k+1) - position_codeur(k))/h;

end

% création d'une nouvelle fenêtre graphique
fig = figure('Units','centimeters','Position',[2 5 35 25]);
set(fig,'Color','white');

% Tracé de la dérivée numérique du signal brut non filtrée
plot(t(1:end-1),dY);
grid on;
grid minor;
title('Calcul de la dérivée numérique du signal non filtré');

%% dérivation brut sans filtrage avec un pas de temps plus grand
% On définit la variable q qui détermine le nombre de pas à prendre en 
% compte pour calculer la dérivée numérique

q = 300;

pas = q * h;
% ti(1) = 0;
% calcul de la dérivée en chaque point
i = 1;
for k = 1:q:(nb_points-1-q)
   dY_q(i) = (position_codeur(k+q)-position_codeur(k))/pas;
   ti(i) = t(k+q);
   i = i + 1;
   end
% création d'une nouvelle fenêtre graphique
fig = figure('Units','centimeters','Position',[2 5 35 25]);
set(fig,'Color','white');

% Tracé de la dérivée numérique du signal brut non filtrée
plot(ti,dY_q);
grid on;
grid minor;
title('Calcul de la dérivée numérique du signal non filtré');
hold all;

%% Filtrage par moyenne glissante puis dérivation
% Filtrage du signal par un filtre mgl

[Y_mgl] = filtre_mgl(position_codeur,300)
figure;
hold all;
plot(t,position_codeur);
plot(t,Y_mgl);

 for k = 1:1:(nb_points-1)
    dY_mgl(k) = (Y_mgl(k+1) - Y_mgl(k))/h;
end

% création d'une nouvelle fenêtre graphique
fig = figure('Units','centimeters','Position',[2 5 35 25]);
set(fig,'Color','white');

% Tracé de la dérivée numérique du signal filtré puis dérivé
plot(t(1:end-1),dY_mgl);
grid on;
grid minor;
title('Calcul de la dérivée numérique du signal non filtré');

