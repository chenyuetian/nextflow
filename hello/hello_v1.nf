#!/usr/bin/env nextflow

str = channel.value('Hello Georgia Advanced Computing Resource Center')  

/*
* extract first letter of each word in hello.txt except for 'Hello'
*/
process splitLetters {

    input:
    stdin str

    output:
    path 'hello.out' into records 

    """
    cat - | awk '{for (i = 2;i<=6; i++ )print \$i}'  | cut -c1  > hello.out
    """
}

/*
* combine letters 
*/
process combine {
 
    input:
    stdin str
    path 'y' from records

    output:
    stdout into result
 
    """
    cat - | awk '{print \$1}' 
    cat 'y' | paste -sd ''
    """
}


result.view { it.trim() }
