# multiomics-shiny-app
An interactive Shiny R app for visualization and analysis of multi-omics datasets, including features like heatmaps, PCA, clustering, and downloadable results.

# Multi-Omics Data Explorer (R Shiny)

This Shiny app allows you to upload multi-omics data (CSV), normalize it, and visualize the results via PCA and heatmaps.

## How to Use

1. Upload your omics data (samples as rows, features as columns, first column: row names).
2. Choose normalization method.
3. Click "Run Analysis".
4. Explore the PCA and Heatmap tabs.
5. Download the normalized data if desired.

---

## Installation

1. **Install R**  
   Download and install R from [CRAN](https://cran.r-project.org/).

2. **Install Required R Packages**  
   Open R or RStudio and run:

install.packages(c("shiny", "DT", "plotly", "doParallel", "matrixStats", "shape"))

if (!requireNamespace("BiocManager", quietly = TRUE))
install.packages("BiocManager")

BiocManager::install("ComplexHeatmap")



## Running the App Locally

1. Clone or download this repository to your computer.

2. Open R or RStudio and set the working directory to the app folder, for example:

setwd("path/to/your/app-folder")

3. Run the app with:

shiny::runApp()

---

## Deployment Notes

- The app may be too large for free shinyapps.io accounts (which have a 1 GB bundle limit).
- Users with **premium shinyapps.io accounts**, **Posit Connect**, or **self-hosted Shiny Server** can deploy this app.
- For self-hosting, see the [Shiny Server documentation](https://posit.co/download/shiny-server/).

---

## Data

- Example datasets (if any) are included in the `data/` folder.
- For large datasets, please download them separately from [provide download link or instructions].

---

## License

This project is licensed under the [MIT License](LICENSE).

---

## Contact

For questions or feedback, please contact:

Berkant Duman  
Email: berkant.duman@gmail.com  


