# SAARA
***Statistical Analysis of Acetylene Reduction Assay***

The Goal of this Soft is to analyse data generated with Agilent GC-FID technology during an Acetylene Reduction Assay (ARA) experiment.
This experiment is used in the study of the legume-rhizobia symbiosis in order to measure the symbiotic efficiency of the interaction.
During the interaction, the plant gather nitrogen that is fixed by the bacteria from the atmospheric pool thanks to an enzymatic complex called nitrogenase.
This allows the plant to accumulate biomass at a higher rate compared to when it is alone. ARA is a method to indirectly estimate the nitrogenase activity.
Indeed, nitrogenase catalyses the reduction of dinitrogen for the atmosphere into ammonia by breaking the triple bound that links the two atoms of nitrogen.
One method to asses the gain in nitrogen in the plant is to use a Elemental Analyser to quantify the income in nitrogen  during symbiosis.
However, the complex has an alternative substrate, acetylene, which can be reduced into ethylene. When we incubate plant roots with non-limiting quantities of acetylene, ethylene will be produced thanks to the nitrogenase.
We can mesaure it thanks to a Gaz Chromatografy (GC) coupled with an Flame Ionization Detector (FID).


## Notes for me :
Data generated thanks to the AGILENT machines are arranged in a tree, the root being named after the experiment name choosen by the user at the beginning of the run.
This folder contains several log files, configuration files and metadata files, as well as a folder for each sample analysed.
The folder name is composed of a three digit number, that corresponds to the sample number in the run, the letter "B", a four digit number that is the concatenation of the vial number and '01' and eventually the string ".D". 
Everything concatenated without blank spaces.
