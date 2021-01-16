# 5RBIG

Record the SUPINFO course

Remainder: this project has to be realized by groups of 4 students max.

For this exam, you have to download and use the following csv file MP-5RBIG:

Source of the dataset: P. Cortez and A. Silva. Using Data Mining to Predict Secondary School Student Performance. In A. Brito and J. Teixeira Eds., Proceedings of 5th FUture BUsiness TEChnology Conference (FUBUTEC 2008) pp. 5-12, Porto, Portugal, April, 2008, EUROSIS, ISBN 978-9077381-39-7. Here is a link to this paper.

These data concern students from two portuguese public schools and were collected during the 2005-2006 academic year. We will study all the variables and their interactions, with a special focus on factors that affect student success.

Here is the description of the different variables:

school - student's school (binary: "GP" - Gabriel Pereira or "MS" - Mousinho da Silveira)
sex - student's sex (binary: "F" - female or "M" - male)
age - student's age (numeric: from 15 to 22)
address - student's home address type (binary: "U" - urban or "R" - rural)
famsize - family size (binary: "LE3" - less or equal to 3 or "GT3" - greater than 3)
Pstatus - parent's cohabitation status (binary: "T" - living together or "A" - apart)
Medu - mother's education (numeric: 0 - none, 1 - primary education (4th grade), 2 – 5th to 9th grade, 3 – secondary education or 4 – higher education)
Fedu - father's education (numeric: 0 - none, 1 - primary education (4th grade), 2 – 5th to 9th grade, 3 – secondary education or 4 – higher education)
Mjob - mother's job (nominal: "teacher", "health" care related, civil "services" (e.g. administrative or police), "at_home" or "other")
Fjob - father's job (nominal: "teacher", "health" care related, civil "services" (e.g. administrative or police), "at_home" or "other")
reason - reason to choose this school (nominal: close to "home", school "reputation", "course" preference or "other")
guardian - student's guardian (nominal: "mother", "father" or "other")
traveltime - home to school travel time (numeric: 1 - <15 min., 2 - 15 to 30 min., 3 - 30 min. to 1 hour, or 4 - >1 hour)
studytime - weekly study time (numeric: 1 - <2 hours, 2 - 2 to 5 hours, 3 - 5 to 10 hours, or 4 - >10 hours)
failures - number of past class failures (numeric: n if 1<=n<3, else 4)
schoolsup - extra educational support (binary: yes or no)
famsup - family educational support (binary: yes or no)
paid - extra paid maths classes (binary: yes or no)
activities - extra-curricular activities (binary: yes or no)
nursery - attended nursery school (binary: yes or no)
higher - wants to take higher education (binary: yes or no)
internet - Internet access at home (binary: yes or no)
romantic - with a romantic relationship (binary: yes or no)
famrel - quality of family relationships (numeric: from 1 - very bad to 5 - excellent)
freetime - free time after school (numeric: from 1 - very low to 5 - very high)
goout - going out with friends (numeric: from 1 - very low to 5 - very high)
Dalc - workday alcohol consumption (numeric: from 1 - very low to 5 - very high)
Walc - weekend alcohol consumption (numeric: from 1 - very low to 5 - very high)
health - current health status (numeric: from 1 - very bad to 5 - very good)
absences - number of school absences (numeric: from 0 to 93)
G1 - first period grade in Math (numeric: from 0 to 20)
G2 - second period grade in Math (numeric: from 0 to 20)
G3 - final grade in Math (numeric: from 0 to 20)
You will find extra information about the context and the variables in the previously mentioned paper.

Your rendering will take the form of a R Markdown notebook (included a R source code and a HTML (or PDF) document).

The use of the library ggplot2 will be appreciated, feel free to documente yourself about it, in particular with this ressource.

All graphics, computations, tests and so on must be introduced, justified and interpreted. A professional report is expected.

In most questions you will have to choose the variables to be studied according to their relevance.

The following is a global storyline of the project, you can add other studies if you want.

Note: some numeric variables can be considered either as categorical or quantitative variables depending on the study context.

Data preparation.
Check fo missing values and impute them if needed.
Add a binary categorical variable called finalResult, with level "pass" if the variable G3 is greater or equal to 10 and "fail" otherwise (Note: don't forget this variable in the following study).
Add a categorical variable called academicGrade, with five levels "A", "B", "C", "D", "E" depending on whether the variable G3 is between 16 and 20, 14 and 15, 12 and 13, 10 and 11, 0 and 9 (Note: don't forget this variable in the following study).
Study of categorical variables.
Study individually the main categorical variables (frequencies, proportions, charts, Chi-squared test of goodness of fit, etc.).
Represent associations between pairs of categorical variables (Stacked bar charts, Grouped bar charts, Segmented bar charts, etc.).
Study associations between pairs of categorical variables with Chi-squared tests.
Study of quantitative variables.
Study individually the main quantitative variables (descriptives statistics, charts, outliers, confidence intervals, relevant statistical tests, etc.).
Compute a correlation matrix for some quantitative variables. Draw a heat map for this correlation matrix and a scatterplot matrix.
Perform a multiple regression between the variable G3 and some of the other quantitative variables.
Study of relationships between categorical and quantitative variables.
Represent associations between quantitative variables and categorical variables (Boxplots, Bar charts for means, Stacked bar charts, Multiple histograms, etc.).
Perform t-tests to compare pairwise the mean of some quantitative variables depending on the two levels of some binary categorical variables.
Perform ANOVA to compare the mean of some quantitative variables depending on the levels of some non binary categorical variables.
Clustering.
Perform a k-means clustering algorithm with some quantitative variables. Determine the optimal number of clusters. Study the final result and the academic grade of students in each cluster.
Same question with a hierarchical clustering algorithm.
Conclusion.
