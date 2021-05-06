%% Programa para ver las proyecciones

%Proyecci�n del campo el�ctrico
proyecciones=vectores'*imag(E);

%% Inicializo la suma
suma=zeros(1,dimeX)';

%% Hago las sumas
for i=1:dimeX
    suma = suma + proyecciones(i)*vectores(:,i);
end

%% Ploteo
figure(3)
subplot(1,2,1)
plot(Espacio,suma,'o-r')
hold on
plot(Espacio,J,'.-k')
title('Reconstruci�n y funci�n corriente')
legend('Reconstruci�n del campo E','Funci�n corriente','Location','best')
xlim([min(Espacio) max(Espacio)])
hold off

subplot(1,2,2)
plot(proyecciones,'o')
hold on
title(['Histograma con max ',num2str(max(proyecciones)),' y min ',num2str(min(proyecciones))])
xlim([min(Espacio) max(Espacio)])
hold off

figure(4)
bar(diag(autovalores))
hold on
fplot(4*pi*w,'.-k')
title('Autovalores de operador')
xlim([min(Espacio) max(Espacio)])
hold off
