PGM
    DCL VAR(&SPLFNAME) TYPE(*CHAR) LEN(10)    /* Nama spooled file */
    DCL VAR(&JOBNAME) TYPE(*CHAR) LEN(10)     /* Nama job spooled file */
    DCL VAR(&USER) TYPE(*CHAR) LEN(10)        /* Nama pengguna spooled file */
    DCL VAR(&SPLFNUMBER) TYPE(*DEC) LEN(5 0)   /* Nomor spooled file */
    DCL VAR(&IFSFILE) TYPE(*CHAR) LEN(256)    /* Path lengkap untuk file IFS */
    DCL VAR(&OUTFILE) TYPE(*CHAR) LEN(20)     /* Nama file output fisik */

    /* Set parameter spooled file */
    CHGVAR VAR(&SPLFNAME) VALUE('MYSPF')       /* Nama spooled file */
    CHGVAR VAR(&JOBNAME) VALUE('MYJOB')        /* Nama job */
    CHGVAR VAR(&USER) VALUE('MYUSER')          /* Nama pengguna */
    CHGVAR VAR(&SPLFNUMBER) VALUE(1)           /* Nomor spooled file (misalnya 1) */
    CHGVAR VAR(&IFSFILE) VALUE('/home/user/myfile.txt') /* Path file IFS tujuan */

    /* Menyalin spooled file ke file fisik sementara */
    CPYSPLF FILE(QPDSPMSG) SPLF(&SPLFNUMBER) TOFILE(MYLIB/QTEMP/MYFILE) JOB(&JOBNAME/&USER/&SPLFNUMBER) SPLNBR(&SPLFNUMBER)

    /* Menyalin file fisik ke file IFS */
    QCPYTOIMPF FROMFILE(MYLIB/QTEMP/MYFILE) TOSTMF(&IFSFILE) MBROPT(*REPLACE) STMFOPT(*APPEND) 

    /* Menghapus file sementara di QTEMP */
    DLTF FILE(MYLIB/QTEMP/MYFILE)

ENDPGM
