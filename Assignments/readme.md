## Assignment

### NLM implementation

* Implement 3 different versions of NLM
* Compare the methods on simulated noisy images
* Create noisy images by adding Gaussian noise of standard deviations 5, 10, 15, 20 and 25
* Use PSNR as similarity metric
* Brief description of each method
* Experimental results
* Analysis
* Conclusion


### Implementation 1:

* Image used: Brain grayscale
* Method: Eucledian distance

| Sr | Std |  mse    |  psnr   |
|--- | ----| --------| ------- |
| 1  |  5  | 12.0409 | 37.3241 |
| 2  |  10 | 15.8931 | 36.1187 |
| 3  |  15 | 26.7327 | 33.8603 |
| 4  |  20 | 41.3700 | 31.9639 |
| 5  |  25 | 52.7390 | 30.9094 |

### Implementation 2:

* Image used: Brain grayscale
* Method: Patch size and half window size, number of neighbours

| Sr | Std |  mse    |  psnr   |
|--- | ----| --------| ------- |
| 1  |  5  | 12.5787 | 37.1344 |
| 2  |  10 | 60.7483 | 30.2954 |
| 3  |  15 | 96.7305 | 28.2751 |
| 4  |  20 | 116.161 | 27.4801 |
| 5  |  25 | 139.908 | 26.6723 |

### Implementation 3:

* Image used: Brain grayscale
* Method: A re-implementation of a proposed implementation but without including loops. Aim is to reduce time complexity.

| Sr | Std |  mse    |  psnr   |
|--- | ----| --------| ------- |
| 1  |  5  | 25.9649 | 33.9869 |
| 2  |  10 | 39.3544 | 32.1808 |
| 3  |  15 | 90.5009 | 28.5642 |
| 4  |  20 | 201.179 | 25.0949 |
| 5  |  25 | 364.823 | 22.5099 |

### References:

https://www.iro.umontreal.ca/~mignotte/IFT6150/Articles/Buades-NonLocal.pdf
https://www.hindawi.com/journals/mpe/2018/8593934/
https://link.springer.com/chapter/10.1007/978-3-642-24999-0_5
https://www.researchgate.net/publication/329038202_Overview_of_image_noise_reduction_based_on_non-local_mean_algorithm
https://www.researchgate.net/publication/4156453_A_non-local_algorithm_for_image_denoising
https://www.ipol.im/pub/art/2011/bcm_nlm/article.pdf
http://pages.cs.wisc.edu/~evanswes/cs766report.doc
https://www.youtube.com/watch?v=Va4Rwoy1v88
https://www.ijarcce.com/upload/2016/may-16/IJARCCE%20183.pdf
http://www.numerical-tours.com/matlab/denoisingadv_6_nl_means/
https://www.slideshare.net/ManchorKo/nonlocal-means-and-its-applications
https://www.ncbi.nlm.nih.gov/pmc/articles/PMC4961432/
https://pdfs.semanticscholar.org/29af/5d404ef7138087e0477055ea3e2bf8560a78.pdf
https://bmcmedimaging.biomedcentral.com/articles/10.1186/s12880-019-0407-4
