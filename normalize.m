%��һ���������׹�һ������ȡͬһ����Ĺ�һ������
%��������ϵ�����Ŵ����ֵ��������������
function M=normalize(M,length)
[row,column]=size(M{1});
index=input('�������������ϵ����\n');
for i=1:row
    for j=1:column
        for k=1:length
            temp(k)=M{k}(i,j);  
        end
        max_temp=max(temp);
        min_temp=min(temp);
        for k=1:length
            y=double((M{k}(i,j)-min_temp)/(max_temp-min_temp));
            M{k}(i,j)=y*index;
        end
    end
end
