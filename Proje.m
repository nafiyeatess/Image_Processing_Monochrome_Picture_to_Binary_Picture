function [output] = Proje(image)
img = imread(image);%Dışarıdan alınan Gri yani Monokrom resim okunur.
[A,B] = size(img); %Resmin boyutu size komutu ile hesaplanır ve satir sütun değerleri atanır.
dimension = A*B;%Resmin toplam piksel boyutunu satir ve sutün değerleri çarpılarak bulunur.
possibility=img; 
final=img;
for i=1:A
    for j=1:B
        counter = 0;  
        for z=1:A
            for k=1:B
                if img(i,j) == img(z,k)
                    counter=counter+1; %Resimde hangi sayıdan kaç adet olduğu burada hesaplanır.Daha sonra olasılık hesabında kullanıyorum.
                end
            end
        end
       possibility(i,j) = (counter / dimension)> 0.004;% (counter / dimension) 0.004 den büyükse TRUE olur ve  Olasilik matrisine 1 yazar. Küçükse False olacağından 0 yazar.   
    end
end
%Buraya kadar Olasilik hesaplandı ve Matrisde Verilen koşula göre 1 ve 0
%değerleri konumuna yerleştirildi.
for i=1:A
    for j=1:B
        if possibility(i,j)~=1 % Olasilik Matrisinde 1 den farklı olan  degerleri 0 yapıyorum. 
        final(i,j)=0;
        else % Olasılık Matrisinde 1 olan konumları 255 ile değiştiriyorum ki resmin çıktısı siyah beyaz görünsün.
            %Aksi halde resim Siyah olacaktır. Yani sadece 0 ve 1 ler
            %olsaydı resmin görüntüsü siyah olacaktı.
        final(i,j)=255;
        end
    end
end
imshow(final);
imwrite(final,'binaryImg.jpg');
end