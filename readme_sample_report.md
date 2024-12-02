Untuk menyalin data dari *spooled file* ke folder IFS (Integrated File System) pada sistem AS/400 (IBM i), Anda bisa menggunakan program CL yang menggabungkan beberapa perintah. Berikut adalah contoh program CL yang menyalin *spooled file* ke dalam folder IFS sebagai file teks:

### Langkah-langkah yang dilakukan oleh program CL:
1. Mengambil informasi tentang *spooled file* yang ingin disalin.
2. Menentukan nama file dan folder tujuan di IFS.
3. Menggunakan perintah `CPYSPLF` untuk menyalin *spooled file* ke dalam file fisik.
4. Menggunakan perintah `QCPYTOIMPF` untuk menyalin data ke dalam file IFS.

### Program CL:
```cl
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
```

### Penjelasan program CL:
1. **DCL (Declare Variable)**: Mendeklarasikan variabel yang diperlukan untuk menampung informasi tentang *spooled file*, nama job, dan nama pengguna.
2. **CHGVAR (Change Variable)**: Mengubah nilai variabel, misalnya mengatur nama spooled file, job, dan nomor spooled file.
3. **CPYSPLF (Copy Spooled File)**: Menyalin *spooled file* ke file fisik sementara di pustaka `QTEMP`.
4. **QCPYTOIMPF (Copy to IFS)**: Menyalin file fisik sementara yang ada di pustaka ke folder IFS, misalnya ke `/home/user/myfile.txt`.
5. **DLTF (Delete File)**: Menghapus file sementara setelah penyalinan selesai.

Pastikan Anda menyesuaikan nama spooled file (`MYSPF`), job (`MYJOB`), pengguna (`MYUSER`), dan nomor spooled file sesuai dengan lingkungan dan kebutuhan Anda.


=====

english 

Certainly! Here's the explanation and the CL program in English:

The goal is to copy a spooled file to an IFS (Integrated File System) folder on the AS/400 (IBM i) system using a CL (Control Language) program. The process involves:
1. Retrieving information about the spooled file.
2. Defining the file and target folder in IFS.
3. Using the `CPYSPLF` command to copy the spooled file to a physical file.
4. Using the `QCPYTOIMPF` command to transfer the file to the IFS.

### CL Program Example:
```cl
PGM
    DCL VAR(&SPLFNAME) TYPE(*CHAR) LEN(10)    /* Spooled file name */
    DCL VAR(&JOBNAME) TYPE(*CHAR) LEN(10)     /* Job name of the spooled file */
    DCL VAR(&USER) TYPE(*CHAR) LEN(10)        /* User name of the spooled file */
    DCL VAR(&SPLFNUMBER) TYPE(*DEC) LEN(5 0)   /* Spooled file number */
    DCL VAR(&IFSFILE) TYPE(*CHAR) LEN(256)    /* Full path for IFS file */
    DCL VAR(&OUTFILE) TYPE(*CHAR) LEN(20)     /* Output physical file name */

    /* Set spooled file parameters */
    CHGVAR VAR(&SPLFNAME) VALUE('MYSPF')       /* Spooled file name */
    CHGVAR VAR(&JOBNAME) VALUE('MYJOB')        /* Job name */
    CHGVAR VAR(&USER) VALUE('MYUSER')          /* User name */
    CHGVAR VAR(&SPLFNUMBER) VALUE(1)           /* Spooled file number (e.g., 1) */
    CHGVAR VAR(&IFSFILE) VALUE('/home/user/myfile.txt') /* Target IFS file path */

    /* Copy spooled file to a temporary physical file */
    CPYSPLF FILE(QPDSPMSG) SPLF(&SPLFNUMBER) TOFILE(MYLIB/QTEMP/MYFILE) JOB(&JOBNAME/&USER/&SPLFNUMBER) SPLNBR(&SPLFNUMBER)

    /* Copy the temporary physical file to the IFS */
    QCPYTOIMPF FROMFILE(MYLIB/QTEMP/MYFILE) TOSTMF(&IFSFILE) MBROPT(*REPLACE) STMFOPT(*APPEND)

    /* Delete the temporary file in QTEMP */
    DLTF FILE(MYLIB/QTEMP/MYFILE)

ENDPGM
```

### Explanation of the CL program:
1. **DCL (Declare Variable)**: Declares the necessary variables to store information about the spooled file, job name, user, and target IFS file path.
2. **CHGVAR (Change Variable)**: Changes the values of variables, such as setting the spooled file name, job, user, and spooled file number.
3. **CPYSPLF (Copy Spooled File)**: Copies the spooled file into a temporary physical file in the `QTEMP` library.
4. **QCPYTOIMPF (Copy to IFS)**: Copies the temporary physical file from the `QTEMP` library to a file in the IFS, e.g., `/home/user/myfile.txt`.
5. **DLTF (Delete File)**: Deletes the temporary file from the `QTEMP` library after the copy operation.

### Important Notes:
- Make sure to adjust the values for the spooled file name (`MYSPF`), job name (`MYJOB`), user (`MYUSER`), and spooled file number as per your system's environment.
- The target IFS file path (`/home/user/myfile.txt`) should be updated to match your desired destination.

If you have any further questions or need additional clarifications, feel free to ask!
