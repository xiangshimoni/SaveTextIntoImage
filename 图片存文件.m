fid = fopen('H:\code\matlab_files\ͼƬ���ļ�\alphabet.txt', 'r');
%c = fread(fid, 5, 'uint8=>char')';
c = fread(fid);%�����ļ�����
c=dec2bin(c);%ת��Ϊ2��������
fclose(fid);
img=imread('H:\code\matlab_files\ͼƬ���ļ�\1.png');%��ͼƬ
figure,imshow(img)
%�ȴ���������һλ
len1=size(c,1);
length = dec2bin(len1);
for i=1:32
    img(i)=bitset(img(i),1,0);    
end
for i=(33-size(length,2)):32
    img(i)=bitset(img(i),1,str2num(length(i+1-(33-size(length,2)))));
end
%�ٴ��������ڶ�λ
len2=size(c,2);
length = dec2bin(len2);
for i=1:32
    img(i)=bitset(img(i),2,0);    
end
for i=(33-size(length,2)):32
    img(i)=bitset(img(i),2,str2num(length(i+1-(33-size(length,2)))));
end
%���ļ�������λ
for i=1:len1*len2
    img(i)=bitset(img(i),3,str2num(c(i)));%���ĵ�һλ
end
imwrite(img,'D:\matlab_files\ͼƬ���ļ�\res.png');
figure,imshow(img)

%===========================================

%��ͼƬ��ȡ�ļ�
img=imread('D:\matlab_files\ͼƬ���ļ�\res.png');%��ͼƬ
len1=[];
for i=1:32
    len1=[len1 num2str(bitget(img(i),1))];%��ȡ�ļ�����
end
len1=bin2dec(len1);
len2=[];
for i=1:32
    len2=[len2 num2str(bitget(img(i),2))];%��ȡ�ļ�����
end
len2=bin2dec(len2);

res=[];
for i=1:len1*len2
    res=[res num2str(bitget(img(i),3))];
end
res=reshape(res,[len1 len2]);%ת�ɶ���������
res=bin2dec(res);%תʮ����
char(res')%ת���ַ�