#!/usr/bin/env nextflow

params.data = "./data/"
params.outdir = "qc_results"
input_ch = Channel.fromPath("${params.data}/*.fastq.gz")
process fastqc {
    input:
    file input from input_ch
    output:
    path ("fastqc_results") into qc_ch

    script:
    """
    mkdir fastqc_results
    fastqc -o fastqc_results $input
    """
} 
    // multiqc -f fastqc_results -o fastqc_results

// process alignment {
//     input:

//     output:

//     script:


// }