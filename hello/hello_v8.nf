#!/usr/bin/env nextflow

params.str = 'Hello Georgia Advanced Computing Resource Center'


/*
* extract first letter of each word in str except for 'Hello'
*/
process splitLetters {
/*
 *   input:
*/
    output:
    path 'hello_*' into records 

    """
    printf "${params.str}" | awk '{for (i = 2;i<=6; i++ )print \$i}'  | cut -c1  | split -l 1 - hello_
    """
}

/*
* combine letters 
*/
process combine {
 
    input:
    path 'y' from records.flatten()

    output:
    stdout into result
 
    """
    printf '${params.str}' | awk '{print \$1}' 
    cat 'y' 
    """
}


result.view { it.trim() }
