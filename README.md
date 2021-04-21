---
editor_options: 
  markdown: 
    wrap: 72
---

> ### Files:

-   mars.R

    -   contains methods:

-   anova.mars()

    -   graphical decomposition

-   fitted.R

    -   returns fitted values of the model

-   residual.R

    -   returns residual values of the model

-   predict.R

    -   returns predicted values of the model for the new data, or the
        fitted values when not provided with new data

-   plot.R

    -   plots out fitted values vs. predictors

-   summary.R

    -   returns the summary of the output

-   test.R

    -   contains examples used for testing functions

> ### Test Dataset:

-   insurance.csv
    (<https://www.kaggle.com/mirichoi0218/insurance/activity>)

    -   dataset contains medical cost billed by health insurance

    -   variables:  
        ***age***: age of primary beneficiary  
        ***sex***: insurance contractor gender, female, male  
        ***bmi***: Body mass index, providing an understanding of body,
        weights that are relatively high or low relative to height,
        objective index of body weight (kg / m ^ 2) using the ratio of
        height to weight, ideally 18.5 to 24.9  
        ***children***: Number of children covered by health insurance /
        Number of dependents  
        ***smoker***: Smoking  
        ***region***: the beneficiary's residential area in the US,
        northeast, southeast, southwest, northwest.  
        ***charges***: Individual medical costs billed by health
        insurance

-   waterquality.csv
    (<https://www.kaggle.com/utcarshagrawal/water-quality-data>)

    -   dataset contains various parameters of water to predict the
        conductivity of water

    -   variables:  
        ***STATION CODE***: Unique code for each place  
        ***LOCATIONS***: Name of the river and where it is flowing  
        ***STATE***: The state in which the river is flowing  
        ***TEMP***: Average value of temperature  
        ***DO***: Average value of dissolved oxygen  
        ***pH***: Average value of pH  
        ***CONDUCTIVITY***: Average value of conductivity  
        ***BOD***: Average value of biochemical oxygen demand  
        ***NITRATE_N\_NITRITE_N***: Average value of nitrate-n and
        nitrite-n  
        ***FECAL_COLIFORM***: Average value of fecal coliform  
        ***TOTAL_COLIFORM***: Average value of total coliform
