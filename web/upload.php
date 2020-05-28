<?php
if (isset($_POST['submit'])){
    $file1 = $_FILES['file1'];
    $file2 = $_FILES['file2'];
    $file3 = $_FILES['file3'];
    $file4 = $_FILES['file4'];

    //print_r($file);
    $fileName1=$_FILES['file1']['name'];
    $fileName2=$_FILES['file2']['name'];
    $fileName3=$_FILES['file3']['name'];
    $fileName4=$_FILES['file4']['name'];

    $fileTmpName1=$_FILES['file1']['tmp_name'];
    $fileTmpName2=$_FILES['file2']['tmp_name'];
    $fileTmpName3=$_FILES['file3']['tmp_name'];
    $fileTmpName4=$_FILES['file4']['tmp_name'];

    $fileSize1=$_FILES['file1']['size'];
    $fileSize2=$_FILES['file2']['size'];
    $fileSize3=$_FILES['file3']['size'];
    $fileSize4=$_FILES['file4']['size'];

    $fileError1=$_FILES['file1']['error'];
    $fileError2=$_FILES['file2']['error'];
    $fileError3=$_FILES['file3']['error'];
    $fileError4=$_FILES['file4']['error'];

    $fileType1=$_FILES['file1']['type'];
    $fileType2=$_FILES['file2']['type'];
    $fileType3=$_FILES['file3']['type'];
    $fileType4=$_FILES['file4']['type'];

    $fileExt1 = explode('.', $fileName1);
    $fileExt2= explode('.', $fileName2);
    $fileExt3 = explode('.', $fileName3);
    $fileExt4 = explode('.', $fileName4);
    

    $fileActualExt1 = strtolower(end($fileExt1));
    $fileActualExt2 = strtolower(end($fileExt2));
    $fileActualExt3 = strtolower(end($fileExt3));
    $fileActualExt4 = strtolower(end($fileExt4));

    $allowed = array('jpg', 'jpeg', 'png', 'gif');

    if (in_array($fileActualExt1, $allowed) || in_array($fileActualExt2, $allowed) || in_array($fileActualExt3, $allowed) || in_array($fileActualExt4, $allowed)){
        if($fileError1==0 || $fileError2==0 || $fileError3==0 || $fileError4==0){
            if ($fileSize1 < 1000000 || $fileSize2 < 1000000 || $fileSize3 < 1000000 || $fileSize4 < 1000000){
                $fileNameNew1=uniqid('', true).".".$fileActualExt1;
                $fileNameNew2=uniqid('', true).".".$fileActualExt2;
                $fileNameNew3=uniqid('', true).".".$fileActualExt3;
                $fileNameNew4=uniqid('', true).".".$fileActualExt4;

                $fileDestination1='uploads/'.$fileNameNew1;
                $fileDestination2='uploads/'.$fileNameNew2;
                $fileDestination3='uploads/'.$fileNameNew3;
                $fileDestination4='uploads/'.$fileNameNew4;

                /*$connect=mysqli_connect("localhost","root","", "asd");
                $sql="INSERT INTO asd(image, image2, image3, image4) VALUES ('$fileNameNew1', '$fileNameNew2', '$fileNameNew3', '$fileNameNew4')";
                mysqli_query($connect, $sql);*/


                move_uploaded_file($fileTmpName1, $fileDestination1);
                move_uploaded_file($fileTmpName2, $fileDestination2);
                move_uploaded_file($fileTmpName3, $fileDestination3);
                move_uploaded_file($fileTmpName4, $fileDestination4);
                header("Location: index.jsp?uploadsuccess");
            }else echo "tul nagy a kep merete";

        }else echo "hiba tortent a file feltoltese kozben";
    }
    else echo "rossz tipus nem toltheted fel";
}
?>