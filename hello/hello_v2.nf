#!/usr/bin/env nextflow

params.str = 'Hello Georgia Advanced Computing Resource Center'


/*
* extract first letter of each word in hello.txt except for 'Hello'
*/
process splitLetters {
/*
 *   input:
*/
    output:
    path 'hello.out' into records 

    """
    printf '${params.str}' | awk '{for (i = 2;i<=6; i++ )print \$i}'  | cut -c1  > hello.out
    """
}

/*
* combine letters 
*/
process combine {
 
    input:
    path 'y' from records

    output:
    stdout into result
 
    """
    printf '${params.str}' | awk '{print \$1}' 
    cat 'y' | paste -sd ''
    """
}


result.view { it.trim() }
