# Vision-Based-Runway-Detector-for-UAV
Bu proje sadece image processing teknikleri kullanılarak bir insansız hava aracının iniş pistini nasıl algıladığını göstermek için geliştirilmiştir. Projenin ilk aşamasında gürültü azaltılması, renk maskesi ve canny + sobel gibi edge detection teknikleri kullanılmıştır, ikinci aşamada ise elde edilen kenarları daha temiz ve sade görebilmek için Opening ve Dilation gibi morfolojik yöntemler kullanılıp sonrasında pistlerdeki beyaz çizgileri algılayabilmek için Hough Transform yöntemi uygulanmıştır.

# 🛩️ Vision-Based UAV Runway Detection

## 📌 Project Overview

This project presents a vision-based system designed to assist Unmanned Aerial Vehicles (UAVs) in detecting and aligning with runway markings during landing. It aims to improve landing safety using classical image processing techniques without relying on machine learning or deep learning models.

---

## 🎯 Objective

To develop a robust image processing pipeline that can:
- Enhance runway visibility in RGB images.
- Detect runway edges and lines under varying conditions.
- Achieve reliable landing alignment for UAVs.
- Operate in real-time through optimized processing techniques.

---

## 🧪 Methodology

### 🔄 Preprocessing Pipeline

1. **Grayscale Conversion & CLAHE**  
   - Enhances contrast using Contrast Limited Adaptive Histogram Equalization.

2. **Noise Removal**  
   - **Gaussian Blur**: Removes soft noise.  
   - **Median Filter**: Removes salt-and-pepper noise.

3. **Color Masking in HSV**  
   - Converts image from RGB to HSV.  
   - Applies mask to isolate white runway markings.

4. **Edge Detection**  
   - Combined use of **Canny** and **Sobel** algorithms for robust edge detection.

5. **Morphological Operations**  
   - **Opening**: Removes small artifacts.  
   - **Dilation**: Enhances connectivity of detected edges.

6. **Hough Transform**  
   - Detects straight lines representing runway edges.  
   - Represents lines using (ρ, θ) in polar coordinates for rotation-invariant detection.

---

## 🧠 Why Use Classical Methods?

- **Interpretability**: Each step is mathematically explainable and controllable.
- **Real-Time Potential**: Lighter computational cost compared to deep learning models.
- **Accuracy**: Strong performance when combining preprocessing, edge detection, and morphology with the Hough Transform.

---

## 📸 Visual Output

- White runway stripes are extracted using HSV thresholding.
- Combined Canny + Sobel edges ensure both sharp and soft line detection.
- Detected lines are overlaid in green.
- Start and end points of each line are highlighted in red and yellow.

---

## 📈 Results

- Runway edges are successfully detected in various lighting and contrast conditions.
- Classical techniques, when combined correctly, yield accurate and consistent detection.
- The pipeline shows strong potential for integration into UAV control systems for real-time landing support.

> The study demonstrates that high accuracy can be achieved without deep learning by combining:
> - Two filters (Gaussian + Median)
> - Two edge detectors (Canny + Sobel)
> - Two morphological operators (Opening + Dilation)

---

## 🔬 Future Work

- Incorporating deep learning models like CNNs to enhance generalization.
- Deploying the system on UAV hardware for real-time validation.
- Enhancing robustness for different runway textures and adverse weather.

---

## 🙏 Acknowledgments

Special thanks to **Dr. Lavdie Rada** for mentorship and technical support.

---

## 📚 References

1. Duda, R. & Hart, P. (1972). Use of the Hough Transformation...  
2. Canny, J. (1986). A Computational Approach to Edge Detection.  
3. Sobel, I. & Feldman, G. (1968). Edge detection.  
4. Shang, J. & Shi, Z. (2007). Vision-based Runway Recognition...  
5. Rovira et al. (2005). Hough-transform for crop row detection.  
6. Marianandam & Ghose (2014). Vision-Based Alignment to Runway...  
7. Otsu, N. (1979). A Threshold Selection Method from Gray-Level Histograms.

---

## 📁 Files

- `runway_detection.py` – Full pipeline implementation  
- `test_images/` – Sample UAV landing images  
- `output/` – Visualized results with detected lines

---

✍️ Author: **Barış Kaya**  
🏫 Bahçeşehir University, Dept. of Artificial Intelligence Engineering  
