R_practice
==========

Room for more practice in R

* We have a lgas csv file and Health facility file for the 774 LGAs
* First we wrote a source R script to load all the requisite libraries (plyr, stringr and ggplot), functions (bool_proportion and outlier) and also read the lga.csv file
*The second script; an outlier script, read in the health facility indicator file and removed all outliers in the data and saved a cleaned health file
* The third script; a facility level script read in the cleaned health file and was used to compute facility level indicators for health facilities.
* An lga script was used to compute data at the lga level
* Finally, a pipeline script was used to run all the 4 other scripts.
* C'est fini

