function y=getImgFile(filename)
img=imread(filename);%��ͼƬ
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
y=char(res')%ת���ַ�
end