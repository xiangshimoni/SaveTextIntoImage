function saveFileIntoImg(imgFileName,txtFileName)
fid = fopen(txtFileName, 'r');
%c = fread(fid, 5, 'uint8=>char')';
c = fread(fid);%�����ļ�����
c=dec2bin(c);%ת��Ϊ2��������
fclose(fid);
img=imread(imgFileName);%��ͼƬ
%figure,imshow(img)
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
if(sum(imgFileName(end-3:end)~='.png')~=0)
    imgFileName(end-3:end)='.png';
    imwrite(img,imgFileName);
end
end