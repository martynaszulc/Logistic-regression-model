# Logistic-regression-model
## Introduction
In this project, I created a linear regression model for a data set called adult. The data comes from the website http://archive.ics.uci.edu/ml/datasets/Adult. The model was to predict a person's income (under 50k per year or over 50k per year). 

Variables in the set: <br >
**age**: continuous. <br >
**workclass**: Private, Self-emp-not-inc, Self-emp-inc, Federal-gov, Local-gov, State-gov, Without-pay, Never-worked. <br >
**fnlwgt**: continuous. <br >
**education**: Bachelors, Some-college, 11th, HS-grad, Prof-school, Assoc-acdm, Assoc-voc, 9th, 7th-8th, 12th, Masters, 1st-4th, 10th, Doctorate, 5th-6th, Preschool.
**education-num**: continuous. <br >
**marital-status**: Married-civ-spouse, Divorced, Never-married, Separated, Widowed, Married-spouse-absent, Married-AF-spouse. <br >
**occupation**: Tech-support, Craft-repair, Other-service, Sales, Exec-managerial, Prof-specialty, Handlers-cleaners, Machine-op-inspct, Adm-clerical, Farming-fishing, Transport-moving, Priv-house-serv, Protective-serv, Armed-Forces. <br >
**relationship**: Wife, Own-child, Husband, Not-in-family, Other-relative, Unmarried. <br >
**race**: White, Asian-Pac-Islander, Amer-Indian-Eskimo, Other, Black. <br >
**sex**: Female, Male. <br >
**capital-gain**: continuous. <br >
**capital-loss**: continuous. <br >
**hours-per-week**: continuous. <br >
**native-country**: United-States, Cambodia, England, Puerto-Rico, Canada, Germany, Outlying-US(Guam-USVI-etc), India, Japan, Greece, South, China, Cuba, Iran, Honduras, Philippines, Italy, Poland, Jamaica, Vietnam, Mexico, Portugal, Ireland, France, Dominican-Republic, Laos, Ecuador, Taiwan, Haiti, Columbia, Hungary, Guatemala, Nicaragua, Scotland, Thailand, Yugoslavia, El-Salvador, Trinadad&Tobago, Peru, Hong, Holand-Netherlands. <br >


## Technologies
The project was written in R programming language.  RStudio 2021.09.0  was used.
Libraries used: 
- tidyverse (to change the value of variables)
- countrycode (for the grouping of countries)
- caret (for confusion matrix)
