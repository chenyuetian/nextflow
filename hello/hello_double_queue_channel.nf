#!/usr/bin/env nextflow

params.str = 'Hello Georgia Advanced Computing Resource Center'
str = channel.of(params.str)
  

/*
* extract first letter of each word in hello.txt except for 'Hello'
*/
process splitLetters {

    input:
    val x from str

    output:
    path 'hello.out' into records 

    '''
    awk '{for (i = 2;i<=6; i++ )print $i}' < 'x' | cut -c1  > hello.out
    '''
}

/*
* combine letters 
*/
process combine {
 
    input:
    path 'y' from records
    val 'z' from str 
    output:
    stdout into result
 
    '''
    cat 'z' | awk '{print $1}' 
    cat 'y' | paste -sd ''
    '''
}


result.view { it.trim() }
