# The-Determinants-of-Income-Across-Texas-Counties
![Median-Income-Rplot](https://github.com/pranjalshrestha/The-Determinants-of-Income-Across-Texas-Counties/assets/135492582/16acc40c-2bef-407e-b97f-98f49a43257f)
**Figure 1:** R-plot showing Income Variations among Texas Counties

## Overview

This repository contains the materials and code for my econometrics research paper, "The Determinants of Income Across Texas Counties." This study investigates the factors influencing median household income across over 250 Texas counties, aiming to address regional economic disparities through data analysis and advanced statistical methods.

## Contents
- **Data_Cleaning_and_Extraction.R**: R script for data cleaning and transformation.
- **Household Income.csv**: Data containing median household income for all counties in the USA.
- **ShresthaPData.dta**: Dataset used in the analysis.
- **ShresthaPPaper.pdf**: The full research paper.
- **Texas_Income_Data.csv**: Raw income data for Texas counties.
- **TX_Income do-file.do**: STATA do-file for regression analysis.

## Research Summary

### Objective
To identify and analyze the determinants of income across Texas counties, providing insights for policymakers to promote economic growth and reduce income disparities.

### Methodology
- **Literature Review**: Conducted an extensive review of existing studies on regional income determinants.
- **Data Collection**: Gathered data from over 250 Texas counties, focusing on various socioeconomic factors.
- **Data Cleaning**: Cleaned and transformed the original data using RStudio.
- **Statistical Analysis**: Employed advanced statistical methods, including logarithmic, multivariate, and polynomial regression, using STATA.

### Key Findings
- **Education Levels**: Higher educational attainment is strongly associated with increased median household income.
- **Unemployment Rates**: Higher unemployment rates are negatively correlated with income levels.
- **Demographic Factors**: Several demographic factors significantly influence median household income, reflecting the socio-economic diversity across Texas counties.
- **Occupational Distributions**: The presence of certain high-income occupations significantly impacts county-level median incomes.

## How to Use This Repository

### Data Cleaning and Transformation:
- Run `Data_Cleaning_and_Extraction.R` to clean and preprocess the raw data in `Texas_Income_Data.csv` and `Household Income.csv`.

### Regression Analysis:
- Use the STATA do-file `TX_Income do-file.do` to perform regression analyses on the cleaned data.

### Research Paper:
- Read the full research findings and detailed methodology in `ShresthaPPaper.pdf`.

## Dependencies
- **R**: Required to run `Data_Cleaning_and_Extraction.R`.
- **STATA**: Required to execute `TX_Income do-file.do`.

## Conclusion
This research provides valuable insights into the determinants of income across Texas counties, offering data-driven recommendations for addressing economic inequalities. Policymakers can leverage these findings to develop targeted interventions aimed at fostering economic growth and reducing income disparities.
