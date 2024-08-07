process samtools {
  container 'biocontainers/samtools:v1.7.0_cv4'
  /
  echo 'hello samtools'
  /
}

process bamtools {
  container 'biocontainers/bamtools:v2.4.0_cv4'
  /
  echo 'hello bamtools'
  /
}

workflow {
  samtools()
  bamtools()
}

