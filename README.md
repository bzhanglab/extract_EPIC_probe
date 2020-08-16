The script generates the probe-to-gene-mapping table and probe-to-transcript-mapping table, both of which are represented as a R list. 
These two tables are further incorporated into the R package genomicWidgets to generate gene- or transcript-level methylation.

This script starts from the EPIC probe annotation (V1.0 B2 Manifest file) that were lifted and re-annotated by Ding's group: https://github.com/ding-lab/cptac_methylation
and extracts the probes located up to 1501 upstream of the TSS and simultaneously in the CpG island.

##Contact
Chen Huang
ibphuangchen@gmail.com