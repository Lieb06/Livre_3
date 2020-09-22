% Calcul de la vitesse de rotation d'un moteur à partir du signal
% délivrée par le codeur en utilisant la dérivation numérique
clear all;
load pos_codeur_1000Hz.mat;

pos = position_codeur;
t = time;
vit_ori = vitesse_codeur;
%détermination de l'intervalle de temps [a;b]
a = t(1);
b = t(end);

% détermination du nombre de points
nb_points = length(t);

% Détermination du pas
h = ((b - a)/(nb_points-1));

q = 1000;

pas = q * h;
ti(1) = 0;
% calcul de la dérivée en chaque point
i = 1;
for k = 1:q:(nb_points-1-q)
   vitesse_codeur(k+q) = (pos(k+q)-pos(k))/pas;
   vit(i) = vitesse_codeur(k+q);
   ti(i) = t(k+q);
   i = i + 1;
   end

% t(end)=[];
% 
% pos(end) = [];
%vit = vit;

figure; 
plot(t, pos);
grid on; grid minor;
figure; grid on; grid minor;hold all;
plot(ti, vit);
plot(t,vit_ori);
