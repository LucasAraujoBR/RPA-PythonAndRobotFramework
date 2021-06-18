*** Settings ***
Documentation     Examples of file operations.
Library           RPA.FileSystem

*** Variables ***
${NEW_DIR_1}=     new-dir-1
${NEW_DIR_2}=     new-dir-2
${NEW_DIR_2_COPY}=    copy-of-new-dir-2
${TEXT_FILE}=     file.txt
${TEXT_FILE_COPY}=    copy-of-file.txt

*** Tasks ***
File operations
    ${dir_exists}=    Does Directory Exist    ${CURDIR}
    ${dir_does_not_exist}=    Does Directory Not Exist    ${CURDIR}
    ${dir_tree}=    Log Directory Tree    ${CURDIR}
    ${dir_is_empty}=    Is Directory Empty    ${CURDIR}
    ${dir_is_not_empty}=    Is Directory Not Empty    ${CURDIR}
    Create File    ${TEXT_FILE}    Imune    overwrite=True
    Wait Until Created    ${TEXT_FILE}
    Touch File    ${TEXT_FILE}
    ${file_exists}=    Does File Exist    ${TEXT_FILE}
    ${file_does_not_exist}=    Does File Not Exist    ${TEXT_FILE}
    ${file_is_empty}=    Is File Empty    ${TEXT_FILE}
    ${file_is_not_empty}=    Is File Not Empty    ${TEXT_FILE}
    ${found_files}=    Find Files    \*.txt
    Append To File    ${TEXT_FILE}    Kids!
    ${text_content}=    Read File    ${TEXT_FILE}
    ${absolute_path}=    Absolute Path    ${TEXT_FILE}
    ${created}=    Get File Creation Date    ${TEXT_FILE}
    ${extension}=    Get File Extension    ${TEXT_FILE}
    ${modified}=    Get File Modified Date    ${TEXT_FILE}
    ${name}=    Get File Name    ${TEXT_FILE}
    ${size}=    Get File Size    ${TEXT_FILE}
    Copy File    ${TEXT_FILE}    ${TEXT_FILE_COPY}
    ${files}=    List Files In Directory    ${CURDIR}
    ${directories}=    List Directories In Directory    ${CURDIR}
    Create Directory    ${NEW_DIR_1}
    ${files_to_move}=    Create List    ${TEXT_FILE}    ${TEXT_FILE_COPY}
    Move Files    ${files_to_move}    ${NEW_DIR_1}    overwrite=True
    Run Keyword If File Exists
    ...    ${NEW_DIR_2}/${TEXT_FILE}
    ...    Remove Directory    ${NEW_DIR_2}    recursive=True
    Move Directory    ${NEW_DIR_1}    ${NEW_DIR_2}    overwrite=True
    Run Keyword And Ignore Error
    ...    Copy Directory    ${NEW_DIR_2}    ${NEW_DIR_2_COPY}
    Run Keyword And Ignore Error
    ...    Change File Extension
    ...    ${NEW_DIR_2}/${TEXT_FILE_COPY}
    ...    .md
    Empty Directory    ${NEW_DIR_2_COPY}
