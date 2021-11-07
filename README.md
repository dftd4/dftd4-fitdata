# Raw data for fitting DFT-D4 damping functions

Electronic energies for all density functionals available with DFT-D4.


## Creating a result script

To create a result script with the missing dispersion energies the raw data files can be processed using the provided *awk* script:

```
awk -F, -f scripts/res.awk ref.csv data/$func.csv
```
