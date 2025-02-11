# Assessing-the-health-of-a-shaft-SVM
**Note:** This project was done as a requirement for the course ENME691- Industrial AI at University of Maryland,College Park and was done in collaboration with Murilo Nicoluzzi (murinico@umd.edu) and Aniket Bharamgonda (abharamg@umd.edu). The data for this project was provided by the Industrial AI Center (iaiCenter) at University of Maryland, College Park. Contact: contact@iaicenter.com

## Project Description
**Rotor Bearing Health Monitoring:** This project implements a machine learning system (Support Vector Machines) to diagnose imbalance faults in rotor-bearing systems using vibration data analysis. The system processes accelerometer data from three operational conditions:

* Healthy: No screws attached to rotating disk
* Faulty (Imbalance 2): Two screws inducing imbalance
* Testing: 30 unlabeled samples for model validation

**Process in brief:** 

* Fast Fourier Transform (FFT) converts raw vibration data to frequency domain
* Amplitude extraction at fundamental frequency as primary feature
* Sideband examination at 40Hz harmonic

## Key Features
* **Multi-kernel SVM:** Tested linear, polynomial, and RBF kernels
* **Hyperparameter Tuning:** Optimized C (0.01-100) and γ (0.01-10) values
* **Confusion Matrix Analysis**: Visualized model performance
* **Workflow**: raw data → FFT processing → classification

## Libraries and Dependencies

* MATLAB R2024b
* Statistics and Machine Learning Toolbox
* Signal Processing Toolbox

Here is the complete report of the project | [Report](https://github.com/user-attachments/files/18746122/Assignment.3.-.final.pdf)
