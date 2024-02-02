
### Assembly summary

```
column -t results/bactopia/bactopia-runs/bactopia-20231216-132134/merged-results/assembly-scan.tsv | less -S
```

### MLST

```bash
find results/bactopia -wholename "*mlst/*tsv" -exec cat {} \; | awk '$2 != "-"' | cut -f1,2
```
#> FG85.fna.gz     pfluorescens
#> FG86.fna.gz     pfluorescens
#> FG158.fna.gz    bcereus
#> FG87.fna.gz     pfluorescens
#> FG100.fna.gz    pputida
#> FG97.fna.gz     pputida
#> FG102.fna.gz    mycobacteria_2
#> FG16.fna.gz     bcereus
#> FG63.fna.gz     pfluorescens
#> FG39.fna.gz     bcereus
#> FG66.fna.gz     pfluorescens
#> FG13.fna.gz     pfluorescens
#> FG35.fna.gz     pfluorescens
#> FG36.fna.gz     pputida

### Sourmash GTDB

```bash
find results/bactopia -wholename "*/sketcher/*sourmash-gtdb*txt" -exec tail -n+2 {} \;
```
FG85,found,d__Bacteria,p__Proteobacteria,c__Gammaproteobacteria,o__Pseudomonadales,f__Pseudomonadaceae,g__Pseudomonas_E,s__Pseudomonas_E fluorescens_AN,
FG45,found,d__Bacteria,p__Bacteroidota,c__Bacteroidia,o__Flavobacteriales,f__Flavobacteriaceae,g__Flavobacterium,s__Flavobacterium sp017352115,
FG42Y,disagree,d__Bacteria,,,,,,,
FG153,found,d__Bacteria,p__Proteobacteria,c__Gammaproteobacteria,o__Burkholderiales,f__Burkholderiaceae,g__Variovorax,s__Variovorax sp900115375,
FG115,disagree,d__Bacteria,p__Proteobacteria,c__Alphaproteobacteria,o__Rhizobiales,f__Rhizobiaceae,,,
FG128,found,d__Bacteria,p__Proteobacteria,c__Alphaproteobacteria,o__Caulobacterales,f__Caulobacteraceae,g__Brevundimonas,s__Brevundimonas intermedia,
FG86,found,d__Bacteria,p__Proteobacteria,c__Gammaproteobacteria,o__Pseudomonadales,f__Pseudomonadaceae,g__Pseudomonas_E,s__Pseudomonas_E fluorescens_AN,
FG6,found,d__Bacteria,p__Proteobacteria,c__Gammaproteobacteria,o__Pseudomonadales,f__Pseudomonadaceae,g__Pseudomonas_E,,
FG46,disagree,d__Bacteria,p__Bacteroidota,c__Bacteroidia,o__Flavobacteriales,f__Weeksellaceae,g__Chryseobacterium,,
FG2,disagree,d__Bacteria,p__Firmicutes,c__Bacilli,o__Bacillales,f__Bacillaceae_H,g__Priestia,,
FG138,disagree,d__Bacteria,p__Firmicutes,c__Bacilli,o__Bacillales,f__Bacillaceae,g__Bacillus,,
FG148,found,d__Bacteria,p__Proteobacteria,c__Alphaproteobacteria,o__Azospirillales,f__Azospirillaceae,g__Niveispirillum,s__Niveispirillum sp017996735,
FG158,disagree,d__Bacteria,p__Firmicutes,c__Bacilli,o__Bacillales,f__Bacillaceae_G,g__Bacillus_A,,
FG156,disagree,d__Bacteria,p__Proteobacteria,c__Alphaproteobacteria,o__Azospirillales,f__Azospirillaceae,g__Niveispirillum,,
FG87,found,d__Bacteria,p__Proteobacteria,c__Gammaproteobacteria,o__Pseudomonadales,f__Pseudomonadaceae,g__Pseudomonas_E,s__Pseudomonas_E fluorescens_AN,
FG47,disagree,d__Bacteria,p__Proteobacteria,c__Gammaproteobacteria,o__Pseudomonadales,f__Pseudomonadaceae,g__Pseudomonas_E,,
FG94,disagree,d__Bacteria,p__Proteobacteria,c__Alphaproteobacteria,o__Sphingomonadales,f__Sphingomonadaceae,,,
FG48,disagree,d__Bacteria,p__Proteobacteria,c__Gammaproteobacteria,o__Burkholderiales,f__Burkholderiaceae,g__Acidovorax,,
FG95,disagree,d__Bacteria,p__Proteobacteria,c__Gammaproteobacteria,o__Burkholderiales,f__Chromobacteriaceae,g__Aquitalea,,
FG121,found,d__Bacteria,p__Proteobacteria,c__Alphaproteobacteria,o__Caulobacterales,f__Caulobacteraceae,g__Caulobacter,s__Caulobacter sp016234625,
FG34,found,d__Bacteria,p__Proteobacteria,c__Gammaproteobacteria,o__Burkholderiales,f__Burkholderiaceae,g__Herbaspirillum,s__Herbaspirillum sp000261365,
FG100,found,d__Bacteria,p__Proteobacteria,c__Gammaproteobacteria,o__Pseudomonadales,f__Pseudomonadaceae,g__Pseudomonas_E,s__Pseudomonas_E asiatica,
FG137,disagree,d__Bacteria,p__Proteobacteria,c__Alphaproteobacteria,o__Sphingomonadales,f__Sphingomonadaceae,g__Novosphingobium,,
FG96,disagree,d__Bacteria,p__Proteobacteria,c__Alphaproteobacteria,o__Rhizobiales,f__Rhizobiaceae,,,
FG7,disagree,d__Bacteria,p__Proteobacteria,c__Alphaproteobacteria,o__Caulobacterales,f__Caulobacteraceae,g__Caulobacter,,
FG56,disagree,d__Bacteria,,,,,,,
FG114,found,d__Bacteria,p__Proteobacteria,c__Alphaproteobacteria,o__Caulobacterales,f__Caulobacteraceae,g__Phenylobacterium,,
FG97,found,d__Bacteria,p__Proteobacteria,c__Gammaproteobacteria,o__Pseudomonadales,f__Pseudomonadaceae,g__Pseudomonas_E,s__Pseudomonas_E hunanensis,
FG43,disagree,d__Bacteria,p__Proteobacteria,c__Gammaproteobacteria,o__Pseudomonadales,f__Pseudomonadaceae,g__Pseudomonas_E,,
FG90,disagree,d__Bacteria,p__Proteobacteria,c__Alphaproteobacteria,o__Sphingomonadales,f__Sphingomonadaceae,,,
FG139,found,d__Bacteria,p__Bacteroidota,c__Bacteroidia,o__Flavobacteriales,f__Flavobacteriaceae,g__Flavobacterium,,
FG58,disagree,d__Bacteria,p__Proteobacteria,c__Alphaproteobacteria,o__Sphingomonadales,f__Sphingomonadaceae,g__Sphingobium,,
FG18,disagree,d__Bacteria,p__Proteobacteria,c__Alphaproteobacteria,o__Rhizobiales,f__Beijerinckiaceae,g__Bosea,,
FG102,disagree,d__Bacteria,p__Actinobacteriota,c__Actinomycetia,o__Mycobacteriales,f__Mycobacteriaceae,g__Mycobacterium,,
FG59,found,d__Bacteria,p__Proteobacteria,c__Gammaproteobacteria,o__Pseudomonadales,f__Pseudomonadaceae,g__Pseudomonas_F,s__Pseudomonas_F sp003234055,
FG8,found,d__Bacteria,p__Proteobacteria,c__Alphaproteobacteria,o__Caulobacterales,f__Caulobacteraceae,g__Brevundimonas,s__Brevundimonas sp006547065,
FG19,found,d__Bacteria,p__Bacteroidota,c__Bacteroidia,o__Flavobacteriales,f__Flavobacteriaceae,g__Flavobacterium,s__Flavobacterium phragmitis,
FG52,found,d__Bacteria,p__Actinobacteriota,c__Actinomycetia,o__Actinomycetales,f__Microbacteriaceae,g__Microbacterium,s__Microbacterium sp013410955,
FG103,disagree,d__Bacteria,p__Proteobacteria,c__Alphaproteobacteria,o__Sphingomonadales,f__Sphingomonadaceae,,,
FG68,disagree,d__Bacteria,p__Bacteroidota,c__Bacteroidia,o__Flavobacteriales,f__Flavobacteriaceae,g__Flavobacterium,,
FG14,found,d__Bacteria,p__Proteobacteria,c__Alphaproteobacteria,o__Sphingomonadales,f__Sphingomonadaceae,,,
FG69,found,d__Bacteria,p__Actinobacteriota,c__Actinomycetia,o__Mycobacteriales,f__Mycobacteriaceae,g__Rhodococcus_B,s__Rhodococcus_B sp001647195,
FG9,found,d__Bacteria,p__Proteobacteria,c__Gammaproteobacteria,o__Pseudomonadales,f__Pseudomonadaceae,g__Pseudomonas_F,s__Pseudomonas_F sp003234055,
FG29,disagree,d__Bacteria,p__Proteobacteria,c__Gammaproteobacteria,o__Pseudomonadales,f__Pseudomonadaceae,g__Pseudomonas_E,,
FG40,found,d__Bacteria,p__Bacteroidota,c__Bacteroidia,o__Flavobacteriales,f__Flavobacteriaceae,g__Flavobacterium,s__Flavobacterium sp017352115,
FG15,found,d__Bacteria,p__Firmicutes,c__Bacilli,o__Bacillales,f__Bacillaceae,g__Bacillus,s__Bacillus safensis,
FG42W,disagree,d__Bacteria,p__Proteobacteria,c__Gammaproteobacteria,o__Burkholderiales,f__Burkholderiaceae,g__Acidovorax,,
FG77,found,d__Bacteria,p__Proteobacteria,c__Alphaproteobacteria,o__Sphingomonadales,f__Sphingomonadaceae,g__Novosphingobium,s__Novosphingobium resinovorum,
FG3,found,d__Bacteria,p__Actinobacteriota,c__Actinomycetia,o__Actinomycetales,f__Microbacteriaceae,g__Microbacterium,,
FG16,disagree,d__Bacteria,p__Firmicutes,c__Bacilli,o__Bacillales,f__Bacillaceae_G,g__Bacillus_A,,
FG63,found,d__Bacteria,p__Proteobacteria,c__Gammaproteobacteria,o__Pseudomonadales,f__Pseudomonadaceae,g__Pseudomonas_E,s__Pseudomonas_E fluorescens_AN,
FG24,found,d__Bacteria,p__Firmicutes,c__Bacilli,o__Bacillales,f__Bacillaceae,g__Bacillus,s__Bacillus safensis,
FG39,disagree,d__Bacteria,p__Firmicutes,c__Bacilli,o__Bacillales,f__Bacillaceae_G,g__Bacillus_A,,
FG65,disagree,d__Bacteria,p__Proteobacteria,c__Alphaproteobacteria,o__Sphingomonadales,f__Sphingomonadaceae,g__Sphingobium,,
FG25,disagree,d__Bacteria,p__Proteobacteria,c__Gammaproteobacteria,o__Burkholderiales,f__Chromobacteriaceae,g__Aquitalea,,
FG154,found,d__Bacteria,p__Proteobacteria,c__Alphaproteobacteria,o__Azospirillales,f__Azospirillaceae,g__Azospirillum,s__Azospirillum sp003590795,
FG152,disagree,d__Bacteria,p__Proteobacteria,c__Gammaproteobacteria,o__Burkholderiales,f__Burkholderiaceae,,,
FG11,found,d__Bacteria,p__Proteobacteria,c__Alphaproteobacteria,o__Sphingomonadales,f__Sphingomonadaceae,g__Sphingobium,,
FG66,found,d__Bacteria,p__Proteobacteria,c__Gammaproteobacteria,o__Pseudomonadales,f__Pseudomonadaceae,g__Pseudomonas_E,s__Pseudomonas_E fluorescens_AN,
FG113,disagree,d__Bacteria,p__Proteobacteria,c__Alphaproteobacteria,o__Rhizobiales,f__Rhizobiaceae,,,
FG89,disagree,d__Bacteria,p__Proteobacteria,c__Gammaproteobacteria,o__Burkholderiales,f__Chromobacteriaceae,g__Chromobacterium,,
FG116,disagree,d__Bacteria,p__Proteobacteria,c__Alphaproteobacteria,o__Rhizobiales,f__Rhizobiaceae,g__Mesorhizobium,,
FG13,found,d__Bacteria,p__Proteobacteria,c__Gammaproteobacteria,o__Pseudomonadales,f__Pseudomonadaceae,g__Pseudomonas_E,s__Pseudomonas_E sp006227205,
FG60,disagree,d__Bacteria,p__Proteobacteria,c__Gammaproteobacteria,o__Burkholderiales,f__Burkholderiaceae,g__Acidovorax,,
FG35,disagree,d__Bacteria,p__Proteobacteria,c__Gammaproteobacteria,o__Pseudomonadales,f__Pseudomonadaceae,g__Pseudomonas_E,,
FG125,disagree,d__Bacteria,p__Proteobacteria,c__Alphaproteobacteria,o__Sphingomonadales,f__Sphingomonadaceae,g__Sphingobium,,
FG21,found,d__Bacteria,p__Bacteroidota,c__Bacteroidia,o__Flavobacteriales,f__Weeksellaceae,g__Chryseobacterium,s__Chryseobacterium gambrini,
FG36,disagree,d__Bacteria,p__Proteobacteria,c__Gammaproteobacteria,o__Pseudomonadales,f__Pseudomonadaceae,g__Pseudomonas_E,,
FG98,disagree,d__Bacteria,p__Proteobacteria,c__Gammaproteobacteria,o__Pseudomonadales,f__Pseudomonadaceae,g__Pseudomonas_E,,
FG22,disagree,d__Bacteria,p__Proteobacteria,c__Gammaproteobacteria,o__Burkholderiales,f__Chromobacteriaceae,g__Chromobacterium,,
FG37,found,d__Bacteria,p__Proteobacteria,c__Gammaproteobacteria,o__Pseudomonadales,f__Pseudomonadaceae,g__Pseudomonas_E,s__Pseudomonas_E japonica,
FG99,found,d__Bacteria,p__Proteobacteria,c__Gammaproteobacteria,o__Burkholderiales,f__Burkholderiaceae,g__Comamonas,,
