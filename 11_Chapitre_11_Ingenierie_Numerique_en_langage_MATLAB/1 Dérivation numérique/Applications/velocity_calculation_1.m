% Calcul de la vitesse de rotation d'un moteur à partir du signal
% délivrée par le codeur en utilisant la dérivation numérique
time = out.time
pos = out.position_codeur
%détermination de l'intervalle de temps [a;b]
a = time(1);
b = time(end);

% détermination du nombre de points
nb_points = length(time);

% Détermination du pas
h = (b - a)/(nb_points-1);


pas = h;

% calcul de la dérivée en chaque point

for k = 1:1:(nb_points-1)
    
        vitesse_codeur(k) = (pos(k+1)-pos(k))/pas;

end
time(end)=[];
pos(end) = [];
vit = vitesse_codeur';

figure; grid on; grid minor;
plot(time, pos);
figure; grid on; grid minor;
plot(time, vit);
