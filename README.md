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

-   forestfires.csv
    (<https://archive.ics.uci.edu/ml/datasets/Forest+Fires>)

    -   dataset contains burned area from forest fires in Portugual

    -   variables:  
        ***X*** - x-axis spatial coordinate within the Montesinho park
        map: 1 to 9  
        ***Y*** - y-axis spatial coordinate within the Montesinho park
        map: 2 to 9  
        ***month*** - month of the year: 'jan' to 'dec'  
        ***day*** - day of the week: 'mon' to 'sun'  
        ***FFMC*** - FFMC index from the FWI system: 18.7 to 96.20  
        ***DMC*** - DMC index from the FWI system: 1.1 to 291.3  
        ***DC*** - DC index from the FWI system: 7.9 to 860.6  
        ***ISI*** - ISI index from the FWI system: 0.0 to 56.10  
        ***temp*** - temperature in Celsius degrees: 2.2 to 33.30  
        ***RH*** - relative humidity in %: 15.0 to 100  
        ***wind*** - wind speed in km/h: 0.40 to 9.40  
        ***rain*** - outside rain in mm/m2 : 0.0 to 6.4  
        ***area*** - the burned area of the forest (in ha): 0.00 to
        1090.84
