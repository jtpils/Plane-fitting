clear all;
data = dlmread('test.txt');                           %чтение из файла
x = data(3:end,1);
y = data(3:end,2);
z = data(3:end,3);
maxDistance = data(1:1,1);
cloud = [x y z];
ptCloud = pointCloud(cloud);                          %формирование облака точек

model = pcfitplane(ptCloud,maxDistance);              %считаем что направление нормали плоскости не важно

a = model.Parameters(1,1);                            %извлечение параметров модели(плоскости)
b = model.Parameters(1,2);
c = model.Parameters(1,3);
d = model.Parameters(1,4);

f = fopen('result.txt','w+');                    %создание файла
fprintf('%f %f %f %f\n', a, b, c, d);
fprintf(f,'%f %f %f %f\n', a, b, c, d);          %запись в файл
fclose(f);                                       %закрытие файла