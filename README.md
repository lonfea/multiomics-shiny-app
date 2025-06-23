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

## Deployment on shinyapps.io

You can deploy this app to [shinyapps.io](https://www.shinyapps.io/), a popular cloud platform for hosting Shiny applications.

**Important shinyapps.io limits:**

- **Free and Starter plans:** Maximum app bundle size is **1 GB**.
- **Basic, Standard, and Professional plans:** Bundle size can be up to **5 GB**.
- If your app directory exceeds your plan’s bundle size limit, deployment will fail[2][6][7].
- The default upload limit for the `rsconnect` package is 3 GB; for paid plans, you can increase this with:

options(rsconnect.max.bundle.size = 5368709120) # 5 GB in bytes

*(Do not set this higher than your shinyapps.io plan allows.)*

**Free plan additional restrictions:**
- Up to **5 apps** per account.
- Up to **25 active hours per month** (total usage across all apps)[1].
- No password protection; all apps are public on the free plan.
- Apps display "Powered by RStudio" branding.

**Note:**  
If your app (including all data and dependencies) is too large for the free plan, you can:
- Use a paid shinyapps.io plan for more space.
- Store large data files externally and load them at runtime.
- Self-host the app using [Shiny Server](https://posit.co/download/shiny-server/) for unlimited space (limited only by your server).

For more details, see the [shinyapps.io user guide](https://docs.posit.co/shinyapps.io/guide/applications/).

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


