% 1. Orijinal Görüntüyü Yükleme
image = imread('xcv.png'); % Görüntü dosyasını yükle
figure; imshow(image); title('Original RGB Image');

% 2. Grayscale ve CLAHE
grayImage = rgb2gray(image); % Grayscale'e dönüştür
claheImage = adapthisteq(grayImage); % CLAHE iyileştirme
figure; imshow(claheImage); title('CLAHE Enhanced Image');

% 3. Gaussian Blur ve Median Filter
smoothedImage = imgaussfilt(claheImage, 2); % Gaussian Blur
filteredImage = medfilt2(smoothedImage, [3, 3]); % Median Filter
figure; imshow(filteredImage); title('Filtered Image');

% 4. Renk Maskesi (Beyaz Şeritlerin Segmentasyonu)
hsvImage = rgb2hsv(image); % HSV uzayına dönüştürme
mask = hsvImage(:,:,3) > 0.65 & hsvImage(:,:,2) < 0.35; % Beyaz renk maskesi
figure; imshow(mask); title('White Stripe Mask');

% 5. Kenar Tespiti (Canny ve Sobel Birleşimi)
cannyEdges = edge(filteredImage, 'Canny', [0.03, 0.15]); % Canny kenar tespiti
sobelEdges = edge(filteredImage, 'Sobel'); % Sobel kenar tespiti
combinedEdges = (cannyEdges | sobelEdges) & mask; % Kenarları birleştir ve maske uygula
figure; imshow(combinedEdges); title('Combined Edges with Mask');

% 6. Morfolojik İşlemler
se = strel('line', 3, 90); % Çizgisel yapı elemanı
cleanedEdges = imopen(combinedEdges, se); % Morfolojik açma
cleanedEdges = imdilate(cleanedEdges, se); % Morfolojik genişletme
figure; imshow(cleanedEdges); title('Processed Edges');

% 7. Hough Transform
[H, theta, rho] = hough(cleanedEdges); % Hough Transform
peaks = houghpeaks(H, 15, 'Threshold', 0.3 * max(H(:))); % Hough tepe noktalarını bul
fillGap = round(size(grayImage, 2) * 0.02); % Çizgi boşluk toleransı
minLength = round(size(grayImage, 2) * 0.02); % Minimum çizgi uzunluğu
lines = houghlines(cleanedEdges, theta, rho, peaks, 'FillGap', fillGap, 'MinLength', minLength);

% 8. Algılanan Çizgilerin Görselleştirilmesi
figure; imshow(image); hold on; title('Detected Lines using Optimized Hough Transform');
for k = 1:length(lines)
    xy = [lines(k).point1; lines(k).point2];
    plot(xy(:,1), xy(:,2), 'LineWidth', 2, 'Color', 'green'); % Çizgiyi çiz
    plot(xy(1,1), xy(1,2), 'x', 'LineWidth', 2, 'Color', 'yellow'); % Başlangıç noktası
    plot(xy(2,1), xy(2,2), 'x', 'LineWidth', 2, 'Color', 'red'); % Bitiş noktası
end
hold off;

