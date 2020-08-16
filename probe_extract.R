library(data.table)
library(tidyr)
probeDt = fread('./annotation_remap_hg38.txt')
probeDtKeyColumn = probeDt[,.(Name,probe_strand, CpG_chrm, CpG_beg, CpG_end,
                                distToTSS, geneNames, transcriptTypes,transcriptIDs, 
                                Probe_rs, CGIposition)]
probeDtKeySeparate =  separate_rows(probeDtKeyColumn, distToTSS, geneNames,transcriptTypes,transcriptIDs,
                                     sep = ";",convert = T)
probeDtKeySeparate = data.table(probeDtKeySeparate)
probeDtKeyClean = probeDtKeySeparate[transcriptTypes=="protein_coding"&distToTSS<0&Probe_rs==""&CGIposition=="Island"]
range(probeDtKeyClean$distToTSS) #-1501    -1

##probe to gene mapping
epicProbe2GeneMappingClean = split(probeDtKeyClean, f=probeDtKeyClean$geneNames)
epicProbe2GeneMappingClean = lapply(epicProbe2GeneMappingClean, function(x)unique(x$Name))
save(epicProbe2GeneMappingClean, file = 'epicProbe2GeneMappingClean.rda')

#probe to transcript mapping
epicProbe2TranscriptMappingClean = split(probeDtKeyClean, f=probeDtKeyClean$transcriptIDs)
epicProbe2TranscriptMappingClean = lapply(epicProbe2TranscriptMappingClean, function(x)unique(x$Name))
save(epicProbe2TranscriptMappingClean, file = 'epicProbe2TranscriptMappingClean.rda')
