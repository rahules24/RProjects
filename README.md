# R Projects 📈

A curated collection of projects created using **R** for data analysis, visualization, and statistical inference. This repository reflects a progression of analytical depth and visual clarity—from basic plots to insightful, publication-grade graphics.

## 🧠 About the Author

Crafted by Ráhul, a passionate data analyst and visualization specialist, with particular expertise in R, ggplot2, and graphical storytelling grounded in **matplotlib-style principles**—including perceptual precision, graphical integrity, and visual clarity.

---

## 📂 Project Structure

### 📁 `basicRplot/`
Contains introductory plots using base R and simple ggplot syntax. Great for understanding:
- Data manipulation basics
- Plotting histograms, bar charts, and scatterplots
- Customizing themes and axes

### 📁 `multiGraphs/`
Showcases the ability to generate comparative visualizations:
- Faceted plots
- Multi-panel layouts
- Use of `gridExtra` and `patchwork` for figure composition

### 📁 `categoricalDataViz/`
Focused on summarizing categorical variables:
- Proportional bar plots
- Mosaic charts
- Legends and color palettes for clear group identification

### 📁 `finalProject/`
> **“What Defines a Season”** — A capstone-level analysis integrating both theoretical reasoning and practical implementation.

Analyzes 35 years of Japanese weather data to challenge and refine our understanding of seasonal definitions—specifically how Japan’s seasons align with **temperature** rather than **daylight**, contrary to Western astronomical conventions.

#### 🔍 Highlights:
- Rigorous dataset treatment from Kaggle (`tokyo_data.csv`)
- Strong narrative using visual storytelling (via `ggplot2`)
- Custom seasonal alignment of months for improved pattern recognition
- Justification of plot choice via **graphical perception principles**
- Expert use of `geom_smooth()` for enhancing interpretability
- Advanced graphical integrity checks including **Lie Factor** validation

📄 Read the full write-up: [`document.pdf`](./finalProject/document.pdf)

---

## 🔧 Tools & Packages

- **Core**: `ggplot2`, `dplyr`, `readr`, `tidyr`
- **Advanced**: `gridExtra`, `patchwork`, `lubridate`, `scales`
- **Philosophy**: Tufte’s principles of graphical excellence + Matplotlib-style minimalism

---

## 🚀 How to Use

1. Clone the repository:
   ```bash
   git clone https://github.com/rahules24/RProjects.git
   cd RProjects
   ```

2. Open your R environment (e.g., RStudio) and load the desired project folder.

3. Run the `.R` scripts and explore the visualizations. For the final project, start with:
   ```R
   source("finalProject/finalProj_rahul.r")
   ```

---

## 📌 Final Note

This repository is more than code—it's a growing demonstration of analytical clarity, coding proficiency, and an eye for meaningful visuals. The final project especially showcases a mature blend of **data storytelling** and **domain reasoning**.
