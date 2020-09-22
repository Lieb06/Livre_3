%% Effacement des variables du workspace
clear all;

% chargement des donn�es correspondant au signal du codeur et au temps dans
% le workspace
load filtrage_mgl.mat;

%% Trac� du signal non filtr� la fen�tre graphique


% cr�ation d'une nouvelle fen�tre graphique
fig = figure('Units','centimeters','Position',[2 5 35 25]);
set(fig,'Color','white');
plot(t,position_codeur);
grid on;
grid minor;
title('Signal issu de la mesure de la position par un codeur');


%% d�rivation brut sans filtrage avec un pas de temps tr�s faible
nb_points = length(t);

% calcul du pas h
h = (t(end)-t(1))/(nb_points - 1);

for k = 1:1:(nb_points-1)
    
        dY(k) = (position_codeur(k+1) - position_codeur(k))/h;

end

% cr�ation d'une nouvelle fen�tre graphique
fig = figure('Units','centimeters','Position',[2 5 35 25]);
set(fig,'Color','white');

% Trac� de la d�riv�e num�rique du signal brut non filtr�e
plot(t(1:end-1),dY);
grid on;
grid minor;
title('Calcul de la d�riv�e num�rique du signal non filtr�');

%% d�rivation brut sans filtrage avec un pas de temps plus grand
% On d�finit la variable q qui d�termine le nombre de pas � prendre en 
% compte pour calculer la d�riv�e num�rique

q = 300;

pas = q * h;
% ti(1) = 0;
% calcul de la d�riv�e en chaque point
i = 1;
for k = 1:q:(nb_points-1-q)
   dY_q(i) = (position_codeur(k+q)-position_codeur(k))/pas;
   ti(i) = t(k+q);
   i = i + 1;
   end
% cr�ation d'une nouvelle fen�tre graphique
fig = figure('Units','centimeters','Position',[2 5 35 25]);
set(fig,'Color','white');

% Trac� de la d�riv�e num�rique du signal brut non filtr�e
plot(ti,dY_q);
grid on;
grid minor;
title('Calcul de la d�riv�e num�rique du signal non filtr�');
hold all;

%% Filtrage par moyenne glissante puis d�rivation
% Filtrage du signal par un filtre mgl

[Y_mgl] = filtre_mgl(position_codeur,300)
figure;
hold all;
plot(t,position_codeur);
plot(t,Y_mgl);

 for k = 1:1:(nb_points-1)
    dY_mgl(k) = (Y_mgl(k+1) - Y_mgl(k))/h;
end

% cr�ation d'une nouvelle fen�tre graphique
fig = figure('Units','centimeters','Position',[2 5 35 25]);
set(fig,'Color','white');

% Trac� de la d�riv�e num�rique du signal filtr� puis d�riv�
plot(t(1:end-1),dY_mgl);
grid on;
grid minor;
title('Calcul de la d�riv�e num�rique du signal non filtr�');

