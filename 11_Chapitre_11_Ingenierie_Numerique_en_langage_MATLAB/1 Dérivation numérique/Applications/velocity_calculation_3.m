% Calcul de la vitesse de rotation d'un moteur � partir du signal
% d�livr�e par le codeur en utilisant la d�rivation num�rique
clear all;
load pos_codeur_1000Hz.mat;

t = time;

% filtrage de la position
figure;hold all;
pos_mgl = filtre_mgl(position_codeur,200);
plot(t,pos_mgl);
plot(t,position_codeur);
grid on; grid minor;
legend('signal brut','signal filtr�');



vit_ori = vitesse_codeur;
%d�termination de l'intervalle de temps [a;b]
a = t(1);
b = t(end);

% d�termination du nombre de points
nb_points = length(t);

% D�termination du pas
h = ((b - a)/(nb_points-1));

for k = 1:1:(nb_points-1)
    
        vitesse_codeur(k) = (pos_mgl(k+1)-pos_mgl(k))/h;

end

% t(end)=[];
% 
% pos(end) = [];
%vit = vit;


grid on; grid minor;
figure; grid on; grid minor;hold all;
plot(t, vitesse_codeur);
plot(t,vit_ori);
