function resizedImage =  resizedImage_bilinear(originalImage, scalingFactor)
    %���o�Ϥ��j�p
    img_size = size(originalImage);
    %�p��resize�᪺�j�p �è����
    zrow = fix(img_size(1)*scalingFactor);
    zcol= fix(img_size(2)*scalingFactor);
    
	%�p�⤺���⦡�һ��ܼ�
	%�ܼ�aiz�O�s�¹�mapping�Ϊ� ��K�p��
    aiz = (1:zrow)/scalingFactor;
	%��floor�ox
    ax1 = floor(aiz);
	%��floor��|�X�{0 ��matlab�x�}��index�q1�}�l �ҥH�N�x�}����0�[1 ��l�D0�Ʀr����
    ax1 = fix(ax1+ 1 - (ax1./(ax1+1)));
	%��ceil�ox+1
    ax2 = ceil(aiz);
	%���l�Ʊox'-x ����m�o�ӯx�}
    arx = rem(aiz,1)';
    
    %�p�⤺���⦡�һ��ܼ�
	%��k�P�W
    ajz =  (1:zcol)/scalingFactor;
    ay1 = floor(ajz);
    ay1 = fix(ay1+ 1 - (ay1./(ay1+1)));
    ay2 = ceil(ajz);
    ary = rem(ajz,1);
    
    
    %�P�_�O�_���m���
    if numel(img_size) == 3
        %�O���ܫŧi�@��3d�}�C
        d = img_size(3);
        zoomimg = zeros(zrow,zcol,d);
		%�N1d���x�}����3d��K�B��
        darx = repmat(arx,1,zcol,3);
        dary = repmat(ary,zrow,1,3);
    else
        %�_�h�ŧi�@��2d�}�C
        zoomimg = zeros(zrow,zcol);
		%�N1d���x�}����2d��K�B��
        darx = repmat(arx,1,zcol);
        dary = repmat(ary,zrow,1);
    end
	
	%���of(x,y) f(x,y+1) f(x+1,y) f(x+1,y+1)
    f11 = double(originalImage(ax1,ay1,:));
    f12 = double(originalImage(ax1,ay2,:));
    f21 = double(originalImage(ax2,ay1,:));
    f22 = double(originalImage(ax2,ay2,:));
    %������ ��.*���x�}���B��
    zoomimg = (1-darx).*((1-dary).*f11+dary.*f12) + darx.*((1-dary).*f21 + dary.*f22);

    %��X���G
    resizedImage = zoomimg;
end

