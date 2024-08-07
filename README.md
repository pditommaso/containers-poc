# containers-poc

Proof of concept mirroring containers to different registries using [Wave](https://seqera.io/wave/). 


### Description 

The pipeline implements two simple tasks, one using `biocontainers/samtools:v1.7.0_cv4` and the 
other `biocontainers/bamtools:v2.4.0_cv4` 

```
process { withName: 'samtools' { container = 'biocontainers/samtools:v1.7.0_cv4' } }
process { withName: 'bamtools' { container = 'biocontainers/bamtools:v2.4.0_cv4' } }
```

When using the profile `docker` the containers are mirrored in the container registry `docker.io/pditommaso/my-mirror` 

Using the inspect command the following configuration should be shown 

```
» nextflow inspect pditommaso/containers-poc -format config -profile docker

process { withName: 'samtools' { container = 'docker.io/pditommaso/my-mirror:71dbc829e76d46d0' } }
process { withName: 'bamtools' { container = 'docker.io/pditommaso/my-mirror:04243395254c21c7' } }
```


When using the profile `quay` the containers are mirrored in the container registry `quay.io/pditommaso/my-mirror` 

```
» nextflow inspect pditommaso/containers-poc -format config -profile quay
process { withName: 'samtools' { container = 'oras://docker.io/pditommaso/my-mirror:f0cb76eb6a731149' } }
process { withName: 'bamtools' { container = 'oras://docker.io/pditommaso/my-mirror:5433b5af1825115a' } }
```

Note the use of Singularity ORAS protocol in the latter config

