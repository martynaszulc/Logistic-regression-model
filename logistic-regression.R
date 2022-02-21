library(tidyverse)
library(countrycode)
library(caret)

columns <- c('age','workclass','fnlwgt','education','EducationNo',
           'MaritalStatus','occupation','relationship','race',
           'sex','CapitalGain','CapitalLoss','HoursPerWeek',
           'NativeCountry','salary')

adult.data <- read.csv("https://archive.ics.uci.edu/ml/machine-learning-databases/adult/adult.data",
                       strip.white = TRUE,
                       stringsAsFactors = TRUE,
                       col.names = columns)


adult.data <- adult.data %>%
  mutate(workclass = fct_recode(workclass,
                                "SL-gov" = "Federal-gov",
                                "SL-gov" = "Local-gov",
                                "self-emp" = "Self-emp-inc",
                                "self-emp" = "Self-emp-not-inc"),
         MaritalStatus = fct_recode(MaritalStatus,
                                     "Married" = "Married-civ-spouse",
                                     "Married" = "Married-spouse-absent",
                                     "Married" = "Married-AF-spouse",
                                     "Not-Married" = "Divorced",
                                     "Not-Married" = "Separated",
                                     "Not-Married" = "Widowed"))


adult.data <- adult.data %>%
  mutate(NativeCountry = fct_recode(NativeCountry,
                                "Americas" = "Columbia",
                                "Europe" = "England",
                                "Asia" = "Hong",
                                "Europe" = "Scotland",
                                "Asia" = "South",
                                "Europe" = "Yugoslavia"))
         
adult.data$NativeCountry <- as.factor(countrycode(sourcevar = adult.data[, "NativeCountry"],
                                                  origin = "country.name",
                                                  destination = "continent"))

adult.data[adult.data == "?"] <- NA
colnames(adult.data)[apply(is.na(adult.data),2,any)]
finaladultadata <- na.omit(adult.data)


finaladultadata$salary <- as.factor(ifelse(finaladultadata$salary == "<=50K", 0, 1))

set.seed(115162)
smp_size <- floor(0.8 * nrow(finaladultadata))
train_ind <- sample(seq_len(nrow(finaladultadata)), size = smp_size)

train <- finaladultadata[train_ind, ]
test <- finaladultadata[-train_ind, ]

glm.fit <- glm(salary ~ .-fnlwgt-EducationNo,
               family = "binomial",
               data = train)

summary(glm.fit)
new.step.model <- step(glm.fit)

pdata <- predict(new.step.model, newdata = test, type = "response")
pdata <- as.factor(ifelse(pdata > 0.5, 1, 0))

caret::confusionMatrix(pdata, reference = test$salary,
                mode = "everything", positive = "1")
