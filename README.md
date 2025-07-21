# JPEG and MPEG-2 Compression From Scratch

![Compression In Action](https://i.imgur.com/a9JbAtW.png)

## 📖 Overview

This project is a from-scratch implementation of the **JPEG** and **MPEG-2** compression standards using MATLAB. It was developed to explore the inner workings of lossy compression algorithms and to gain a deeper understanding of digital image and video processing.

---

## ✨ Features

* **JPEG Encoder & Decoder:**
    * Full implementation of the baseline JPEG compression pipeline.
    * Customizable quantization tables.
    * Chroma subsampling (4:2:0, 4:2:2, 4:4:4).
* **MPEG-2 Encoder & Decoder:**
    * Implementation of I-frames, P-frames, and B-frames.
    * Motion estimation and compensation.
    * Support for different GOP (Group of Pictures) structures.

---

## ⚙️ How It Works

### JPEG Compression Pipeline

The JPEG compression process involves several key steps to reduce the size of an image file:

1.  **Color Space Conversion:** The image is converted from the **RGB** color space to **YCbCr**. Y represents the luminance (brightness), while Cb and Cr represent the chrominance (color). This is done because the human eye is more sensitive to changes in brightness than in color, allowing for more aggressive compression on the color channels.
2.  **Chroma Subsampling:** To further reduce file size, the resolution of the chrominance channels (Cb and Cr) is reduced. This is often done in ratios like 4:2:2 or 4:2:0.
3.  **Block Splitting:** The image is divided into 8x8 blocks of pixels.
4.  **Discrete Cosine Transform (DCT):** The DCT is applied to each block, converting the spatial domain data into the frequency domain. This separates the high-frequency and low-frequency components of the image.
5.  **Quantization:** This is the main "lossy" step. The DCT coefficients are divided by a quantization table and rounded. Higher frequency components, which are less perceptible to the human eye, are quantized more aggressively.
6.  **Entropy Coding:** The quantized DCT coefficients are then losslessly compressed using techniques like Run-Length Encoding (RLE) and Huffman coding to create the final compressed JPEG file.

The decoding process is simply these steps in reverse.

### MPEG-2 Compression Pipeline

MPEG-2 extends the concepts of JPEG to video. It uses a combination of intra-frame and inter-frame compression.

* **I-Frames (Intra-coded):** These are essentially JPEG-compressed still images and serve as reference points in the video stream. They don't depend on any other frames for decoding.
* **P-Frames (Predicted):** These frames are encoded by referencing a previous I-frame or P-frame. They only store the *differences* between the current frame and the reference frame, which is much more efficient than storing the entire frame. This is achieved through **motion estimation and compensation**, where the encoder finds blocks in the reference frame that are similar to blocks in the current frame and records the motion vectors.
* **B-Frames (Bi-directional):** These frames can reference both previous and future I-frames or P-frames, allowing for even greater compression ratios.

A sequence of these frames is called a **Group of Pictures (GOP)**.

---

## 🚀 Getting Started

### Prerequisites

* MATLAB R2021a or later.
* Image Processing Toolbox.

### Installation & Usage

1.  Clone the repository:
    ```bash
    git clone [https://github.com/](https://github.com/)[your-username]/[your-repo-name].git
    ```
2.  Open MATLAB and navigate to the cloned repository's directory.
3.  To compress an image, run the `compress_jpeg` script:
    ```matlab
    compress_jpeg('my_image.bmp', 'compressed_image.jpg');
    ```
4.  To decompress an image, run the `decompress_jpeg` script:
    ```matlab
    decompress_jpeg('compressed_image.jpg', 'restored_image.bmp');
    ```
5.  [Add similar usage instructions for your MPEG-2 implementation]

---

## 🤝 Contributing

Contributions are welcome! If you'd like to contribute to this project, please follow these steps:

1.  Fork the repository.
2.  Create a new branch (`git checkout -b feature/your-feature`).
3.  Make your changes.
4.  Commit your changes (`git commit -m 'Add some feature'`).
5.  Push to the branch (`git push origin feature/your-feature`).
6.  Open a Pull Request.

Please make sure to update tests as appropriate.

---

## 📜 License

This project is licensed under the [Your License Name] License - see the `LICENSE.md` file for details.
