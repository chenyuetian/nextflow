#!/usr/bin/env nextflow
/*
* hello.txt saves the text string 'Hello Georgia Advanced Computing Resource Center'
*/
params.in = "$baseDir/hello.txt"


/*
* extract first letter of each word in hello.txt except for 'Hello'
*/
process splitLetters {

    input:
    path 'x' from params.in

    output:
    path 'hello.out' into records 

    script:
    template 'split.sh' 
}

/*
* combine letters 
*/
process combine {
 
    input:
    path 'y' from records
    path 'z' from params.in 
    output:
    stdout into result
 
    '''
    cat 'z' | awk '{print $1}' 
    cat 'y' | paste -sd ''
    '''
}

result.view { it.trim() }
