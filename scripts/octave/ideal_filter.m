close all;

I = imread('/home/gustavoneves/masters_degree/dev/sonar_toolkit/data/images/gemini-jequitaia.0-10.png');
I = im2double(I);

imshow(mat2gray(I));

[ir,ic,iz] = size(I);

hr = (ir-1)/2;
hc = (ic-1)/2;

[x, y] = meshgrid(-hc:hc, -hr:hr);

fc=0.2;
A=sqrt((x/hc).^2 + (y/hr).^2);

H=double(A <= fc);
imshow(mat2gray(H));

F=fftshift(fft2(double(I)));

S = log(abs(F) + 1);
size(S)
figure;
imshow(mat2gray(S));


LI=H.*F;
HI=(1-H).*F;

LI = abs(ifft2(ifftshift(LI)));
figure
imshow(LI)

HI = abs(ifft2(ifftshift(HI)));
figure
imshow(HI)


