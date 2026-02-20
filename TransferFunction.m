clc
clear all
close all

%Define un vector tiempo (opcional para este caso)
t = 0:0.01:40;
%Definir parametros
m = 5;
b = 2; 
k = 3;
% Definir el sistema
num = [1]; 
den = [m b k]; 
H = tf(num, den);

%Obtenemos los polos y ceros
p = pole(H);
z = zero(H);

%Mostrar la FT y los valores de los polos y ceros
disp('Función de transferencia H');
printsys(num,den);
disp('Los polos del sistema están en:');
disp(p);
disp('Los ceros del sistema están en:');
disp(z);

% Gráfica de Polos y Ceros
pzmap(H); 
% Encuentra los polos y ceros por su 'tag' y cambia el tamaño
l_pole = findall(gca, 'Tag', 'PZ_Pole');
l_zero = findall(gca, 'Tag', 'PZ_Zero');
set(l_pole, 'MarkerSize', 15, 'LineWidth', 2); % Polos más grandes y gruesos
set(l_zero, 'MarkerSize', 15, 'LineWidth', 2); % Ceros más grandes y gruesos
grid on;
title('Mapa de Polos y Ceros (2do Orden)');

figure;
% Datos de salida (y) y tiempo (t) de la función de transferencia H
[y, t] = step(t,5*H); 
plot(t, y, 'LineWidth', 2.5);
grid on;
title('Respuesta al Escalón');
