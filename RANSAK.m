clear all;
data = dlmread('test.txt');                           %������ �� �����
x = data(3:end,1);
y = data(3:end,2);
z = data(3:end,3);
maxDistance = data(1:1,1);
cloud = [x y z];
ptCloud = pointCloud(cloud);                          %������������ ������ �����

model = pcfitplane(ptCloud,maxDistance);              %������� ��� ����������� ������� ��������� �� �����

a = model.Parameters(1,1);                            %���������� ���������� ������(���������)
b = model.Parameters(1,2);
c = model.Parameters(1,3);
d = model.Parameters(1,4);

f = fopen('result.txt','w+');                    %�������� �����
fprintf('%f %f %f %f\n', a, b, c, d);
fprintf(f,'%f %f %f %f\n', a, b, c, d);          %������ � ����
fclose(f);                                       %�������� �����